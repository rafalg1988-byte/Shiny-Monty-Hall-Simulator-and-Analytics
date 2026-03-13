# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# License: All rights reserved © 2026.
# Part: Server Logic (server.R) 
# ==============================================================================

server <- function(input, output, session) {
  
  # 1. CLOUD DATA SYNCHRONIZATION (Google Sheets) ------------------------------
  # Reactive value for global statistics aggregated from the cloud database
  global_counts <- reactiveVal(c("1" = 0, "2" = 0, "3" = 0))
  
  # Fetch, parse, and aggregate global data upon session start
  observe({
    tryCatch({
      all_data <- googlesheets4::read_sheet(SHEET_ID)
      
      if (nrow(all_data) > 0 && "prize_dist" %in% names(all_data)) {
        tmp_counts <- c("1" = 0, "2" = 0, "3" = 0)
        
        for (i in 1:nrow(all_data)) {
          row <- all_data[i, ]
          p_dist <- as.character(row$prize_dist)
          
          if (startsWith(as.character(row$type), "Sim")) {
            # Multi-record parser: extracts B1, B2, B3 counts from simulation strings
            # Example format: "B1:10 | B2:5 | B3:15"
            b_vals <- sapply(1:3, function(x) {
              pattern <- paste0("B", x, ":(\\d+)")
              res <- gsub(paste0(".*", pattern, ".*"), "\\1", p_dist)
              val <- as.numeric(res)
              if (is.na(val)) 0 else val
            })
            tmp_counts <- tmp_counts + b_vals
            
          } else if (row$type == "User") {
            # Single-record parser: processes individual game prize locations
            if (p_dist %in% names(tmp_counts)) {
              tmp_counts[p_dist] <- tmp_counts[p_dist] + 1
            }
          }
        }
        global_counts(tmp_counts)
      }
    }, error = function(e) {
      warning("Cloud database sync failed: ", e$message)
    })
  })
  
  # 2. REACTIVE STATE MANAGEMENT -----------------------------------------------
  # Core application state: tracks game progress, user settings, and session stats
  values <- reactiveValues(
    lang           = "pl",
    zonk_symbol    = "🐈",
    prize          = sample(1:3, 1),
    initial_choice = NULL,
    revealed       = NULL,
    final_choice   = NULL,
    mute           = FALSE,
    stage          = "choose_initial", # Stages: choose_initial -> choose_final -> end
    last_won       = NULL,
    total          = 0,
    wins_stay      = 0,
    losses_stay    = 0,
    wins_switch    = 0,
    losses_switch  = 0,
    ci_method      = "wilson",
    conf_level     = 0.95,
    prize_counts   = c("1" = 0, "2" = 0, "3" = 0),
    global_data    = NULL,
    
    # In-memory buffer for the current session's logs before final cloud sync
    session_buffer = data.frame(
      timestamp  = as.POSIXct(character()),
      strategy   = character(),
      result     = character(),
      type       = character(),
      session_id = character(),
      prize_dist = character(),
      stringsAsFactors = FALSE
    )
  )
  
  # 3. GLOBAL STATISTICS & FAIRNESS LOGIC ------------------------------------
  
  # Aggregates cloud data and current session data for real-time fairness analysis
  total_fairness_data <- reactive({
    req(global_counts())
    # Vector addition of cloud counts and local session counts
    global_counts() + values$prize_counts
  })
  
  # Renders the distribution plot to verify prize randomness
  output$global_fair_plot <- renderPlot({
    counts <- total_fairness_data()
    t <- i18n[[values$lang]]
    if (sum(counts) == 0) return(NULL)
    
    # Prepare data frame for ggplot2 with percentage labels
    df_g <- data.frame(
      Bramka = paste(t$door, 1:3),
      Ilosc  = as.numeric(counts),
      Proc   = paste0(round(as.numeric(counts) / sum(counts) * 100, 1), "%")
    )
    
    ggplot(df_g, aes(x = Bramka, y = Ilosc, fill = Bramka)) +
      geom_col(alpha = 0.85, color = "white", width = 0.7) +
      geom_text(
        aes(label = Proc),
        position = position_stack(vjust = 0.5),
        size = 6, color = "white", fontface = "bold"
      ) +
      scale_fill_manual(values = c("#18bc9c", "#3498db", "#f39c12")) +
      labs(x = NULL, y = t$global_y_label, title = t$global_title) +
      theme_minimal() +
      theme(
        legend.position = "none",
        text = element_text(size = 14, family = "Lato"),
        plot.title = element_text(face = "bold", hjust = 0.5),
        panel.grid.major.x = element_blank()
      )
  })
  
  # Renders the summary table for precise numerical reference
  output$global_fair_table <- renderTable({
    total_v <- total_fairness_data()
    t <- i18n[[values$lang]]
    if (sum(total_v) == 0) return(NULL)
    
    # Build formatted table with explicit column naming for i18n support
    df_tab <- data.frame(
      col1 = paste(t$door, 1:3),
      col2 = formatC(as.numeric(total_v), format = "d", big.mark = " "),
      col3 = paste0(round(as.numeric(total_v) / sum(total_v) * 100, 1), "%"),
      stringsAsFactors = FALSE
    )
    
    # Assigning column names according to the selected language
    colnames(df_tab) <- c(t$door, "N", "%")
    return(df_tab)
  }, align = 'c', bordered = TRUE, spacing = 'm')
  
  
  # 4. DYNAMIC UI GENERATORS -------------------------------------------------
  
  # Helper function to maintain UI consistency across different settings panels.
  # Parameters: 
  # - prefix: string for unique input namespaces
  # - t: current translation list
  # - is_intro: boolean to toggle advanced view in the startup modal
  settings_ui_gen <- function(prefix, t, is_intro = FALSE) {
    tagList(
      radioButtons(
        paste0(prefix, "lang"), t$lang,
        choices = c("Polski" = "pl", "English" = "en", "Deutsch" = "de"),
        selected = values$lang, inline = TRUE
      ),
      
      selectInput(
        paste0(prefix, "zonk"), t$zonk_select,
        choices = setNames(
          c("🐈", "🐐"), 
          c(paste(t$zonk_cat, "🐈"), paste(t$zonk_goat, "🐐"))
        ),
        selected = values$zonk_symbol
      ),
      
      checkboxInput(paste0(prefix, "mute"), t$mute_label, value = values$mute),
      
      # Logic for Advanced Statistics (confidence intervals) settings (conditional rendering)
      if (is_intro) {
        tagList(
          p(t$intro_adv_info, style = "font-size:0.9em; color:#7f8c8d;"),
          checkboxInput(paste0(prefix, "show_adv"), t$show_adv, FALSE),
          
          conditionalPanel(
            condition = sprintf("input['%sshow_adv']", prefix),
            tags$hr(),
            radioButtons(
              paste0(prefix, "ci"), t$method_select,
              choices = c("Wald" = "wald", "Wilson" = "wilson"),
              selected = values$ci_method
            ),
            sliderInput(
              paste0(prefix, "conf"), t$conf_level,
              min = 0.8, max = 0.99, value = values$conf_level
            )
          )
        )
      } else {
        # Standard display for Sidebar/Options menu
        tagList(
          tags$hr(),
          radioButtons(
            paste0(prefix, "ci"), t$method_select,
            choices = c("Wald" = "wald", "Wilson" = "wilson"),
            selected = values$ci_method
          ),
          sliderInput(
            paste0(prefix, "conf"), t$conf_level,
            min = 0.8, max = 0.99, value = values$conf_level
          )
        )
      }
    )
  }
  
  # 5. MODALS & SETTINGS SYNC --------------------------------------------------
  
  # Startup Welcome Modal
  # Displays the intro text and initial configuration upon session initialization
  observe({
    t <- i18n[[values$lang]]
    showModal(
      modalDialog(
        title = "Monty Hall Paradox",
        p(strong(t$intro_text)),
        hr(),
        settings_ui_gen("intro_", t, is_intro = TRUE),
        footer = actionButton("close_intro", "Start!", class = "btn-success"),
        easyClose = FALSE
      )
    )
  }, priority = 10) # High priority ensures this runs first
  
  # Handle Intro Closure
  observeEvent(input$close_intro, {
    removeModal()
  })
  
  # Sidebar/Options Settings Modal
  observeEvent(input$show_settings, {
    t <- i18n[[values$lang]]
    showModal(modalDialog(
      title = t$settings,
      settings_ui_gen("set_", t),
      footer = modalButton("OK")
    ))
  })
  
  # Global Settings Synchronization Loop
  # Listens to inputs from both UI namespaces ('intro_' and 'set_') 
  # and updates the central 'values' reactive object accordingly.
  observe({
    for (p in c("intro_", "set_")) {
      
      # Sync Language preference
      l_val <- input[[paste0(p, "lang")]]
      if (!is.null(l_val)) values$lang <- l_val
      
      # Sync Zonk Symbol (Cat vs Goat)
      z_val <- input[[paste0(p, "zonk")]]
      if (!is.null(z_val)) values$zonk_symbol <- z_val
      
      # Sync Mute State
      m_val <- input[[paste0(p, "mute")]]
      if (!is.null(m_val)) values$mute <- m_val
      
      # Sync Statistical (Confidence intervals) Methodology (Wald vs Wilson)
      c_val <- input[[paste0(p, "ci")]]
      if (!is.null(c_val)) values$ci_method <- c_val
      
      # Sync Confidence Level (0.8 - 0.99)
      v_val <- input[[paste0(p, "conf")]]
      if (!is.null(v_val)) values$conf_level <- v_val
    }
  })
  
  # 6. STATIC CONTENT: SCIENCE TAB -----------------------------------
  
  # science texts are in the "texts.r" file, loaded in "app.r"
  output$science_content <- renderUI({
    # Reaguje na zmianę values$lang
    req(values$lang) 
    science_texts[[values$lang]]
  })
  
  # 7. GAME LOGIC ENGINE -----------------------------------------------------
  
  # Completely reset all session-level statistics and game state
  observeEvent(input$reset_all, {
    # Log the reset action to the session buffer for audit/tracking purposes
    reset_entry <- data.frame(
      timestamp  = Sys.time(),
      strategy   = "RESET_ACTION",
      result     = "User clicked Reset Statistics",
      type       = "System",
      session_id = session$token,
      prize_dist = "N/A",
      stringsAsFactors = FALSE
    )
    values$session_buffer <- rbind(values$session_buffer, reset_entry)
    
    # Reset UI-visible counters
    values$total          <- 0
    values$wins_stay      <- 0
    values$losses_stay    <- 0
    values$wins_switch    <- 0
    values$losses_switch  <- 0
    
    # Initialize game state for a clean start
    values$prize          <- sample(1:3, 1)
    values$initial_choice <- NULL
    values$final_choice   <- NULL
    values$revealed       <- NULL
    values$stage          <- "choose_initial"
    values$last_won       <- NULL
  })
  
  # Core state machine for handling door interactions
  handle_click <- function(d) {
    # STAGE 1: Initial user choice
    if (values$stage == "choose_initial") {
      trigger_sound("sound_click", mute = values$mute)
      values$initial_choice <- d
      
      # Logic: Host reveals a door that is NOT the prize and NOT the user choice
      gs <- setdiff(setdiff(1:3, d), values$prize)
      values$revealed <- if (length(gs) > 1) sample(gs, 1) else gs
      
      values$stage <- "choose_final"
      
      # STAGE 2: Final Choice (Decision to Stay or Switch)
    } else if (values$stage == "choose_final" && d != values$revealed) {
      values$final_choice <- d
      w <- (d == values$prize)
      values$last_won <- w
      
      # Update fairness distribution counter
      values$prize_counts[as.character(values$prize)] <- 
        values$prize_counts[as.character(values$prize)] + 1
      
      # Audio feedback
      if (w) trigger_sound("sound_win", mute = values$mute) else trigger_sound("sound_loss", mute = values$mute)
      
      # Statistical categorization
      if (d == values$initial_choice) {
        if (w) values$wins_stay <- values$wins_stay + 1 
        else values$losses_stay <- values$losses_stay + 1
      } else {
        if (w) values$wins_switch <- values$wins_switch + 1 
        else values$losses_switch <- values$losses_switch + 1
      }
      
      # Buffered Data Logging (for cloud sync)
      new_entry <- data.frame(
        timestamp  = Sys.time(),
        strategy   = ifelse(values$initial_choice == values$final_choice, "Stay", "Switch"),
        result     = as.integer(w),
        type       = "User",
        session_id = session$token,
        prize_dist = as.character(values$prize),
        stringsAsFactors = FALSE
      )
      values$session_buffer <- rbind(values$session_buffer, new_entry)
      
      values$total <- values$total + 1
      values$stage <- "end"
    }
  }

  # 8. EVENT HANDLERS & SIMULATION ------------------------------------------
    
  # Observers for door button clicks (Linking UI to Logic Engine)
  observeEvent(input$btn_1, handle_click(1))
  observeEvent(input$btn_2, handle_click(2))
  observeEvent(input$btn_3, handle_click(3))
  
  # Setup for a new round (clears temporary state without resetting history)
  observeEvent(input$next_round, {
    values$prize          <- sample(1:3, 1)
    values$initial_choice <- NULL
    values$final_choice   <- NULL
    values$revealed       <- NULL
    values$stage          <- "choose_initial"
    values$last_won       <- NULL
  })
  
  # 9. MONTE CARLO SIMULATIONS AND MODALS------------------------------------------
  # Note: The core logic for 'run_sim' is defined in 'R/utils.R'.
  # It executes N iterations of the Monty Hall problem using both strategies
  # and updates the 'values' reactive object accordingly.'
  
  # Simulation Trigger Buttons (automated simulations with varying sample sizes)
  observeEvent(input$sim10,   run_sim(10,   values, session))
  observeEvent(input$sim100,  run_sim(100,  values, session))
  observeEvent(input$sim1000, run_sim(1000, values, session))
  
  # Display Legal/Information Modal
  # Uses the i18n list for multi-language support (defined in 'global.R')
  observeEvent(input$info_btn, {
    t <- i18n[[values$lang]]
    showModal(
      modalDialog(
        title     = t$legal_title,
        t$legal_body,
        easyClose = TRUE,
        footer    = modalButton("OK"),
        size      = "m"
      )
    )
  })
    
  # 10. REACTIVE TEXT RENDERING (I18N) --------------------------------------  
  
  # Main UI Labels & Tabs: Dynamic translation based on values$lang
  output$ui_title       <- renderText(i18n[[values$lang]]$title)
  output$ui_tab_game    <- renderText(i18n[[values$lang]]$tab_game)
  output$ui_tab_science <- renderText(i18n[[values$lang]]$tab_science)
  output$ui_tab_fair    <- renderText(i18n[[values$lang]]$tab_fair)
  output$ui_tab_how     <- renderText(i18n[[values$lang]]$tab_how)
  output$ui_tab_how_h   <- renderText(i18n[[values$lang]]$tab_how)
  
  # Instructional & Informational Texts
  output$ui_how_text    <- renderText(i18n[[values$lang]]$how_to_text)
  output$ui_fair_title  <- renderText(i18n[[values$lang]]$fair_title)
  output$ui_fair_desc   <- renderText(i18n[[values$lang]]$fair_desc)
  output$ui_fair_extra  <- renderText(i18n[[values$lang]]$fair_extra)
  output$ui_fair_extra2 <- renderText(i18n[[values$lang]]$fair_extra2)
  
  # Buttons, Labels & Footer
  output$ui_author      <- renderText(i18n[[values$lang]]$author)
  output$ui_stats_title <- renderText(i18n[[values$lang]]$stats_title)
  output$btn_again      <- renderText(i18n[[values$lang]]$play_again)
  output$ui_sim_label   <- renderText(i18n[[values$lang]]$sim_label)
  output$btn_reset      <- renderText(i18n[[values$lang]]$reset_stats)
  
  # Dynamic Game Status Message: Updates based on game stage and win/loss outcome
  output$info <- renderText({
    t <- i18n[[values$lang]]
    if (values$stage == "choose_initial") {
      t$info_init
    } else if (values$stage == "choose_final") {
      t$info_final
    } else if (isTRUE(values$last_won)) {
      t$info_win
    } else {
      t$info_loss
    }
  })
  
  # 11. LOCAL STATISTICS & PLOTS --------------------------------------------
  
  # Bar plot showing the distribution of prizes across doors (Fairness Check)
  output$fair_plot <- renderPlot({
    # 1. Setup & Translations
    t <- i18n[[values$lang]]
    counts <- values$prize_counts
    
    # 2. Validation: Prevent rendering if no data is available
    if (sum(counts) == 0) return(NULL)
    
    # 3. Data Preparation for ggplot2
    df <- data.frame(
      Bramka = paste(t$door, 1:3),
      Ilosc  = as.numeric(counts),
      Proc   = paste0(round(as.numeric(counts) / sum(counts) * 100, 1), "%")
    )
    
    # 4. Visualization: Clean bar chart with consistent branding
    ggplot(df, aes(x = Bramka, y = Ilosc, fill = Bramka)) +
      # Bars with custom styling
      geom_col(alpha = 0.85, color = "white") +
      # Percent labels inside bars
      geom_text(
        aes(label = Proc),
        position = position_stack(vjust = 0.5),
        size     = 6,
        color    = "white",
        fontface = "bold"
      ) +
      # Consistent Monty Hall Branding (Colors for three doors)
      scale_fill_manual(values = c("#18bc9c", "#3498db", "#f39c12")) +
      theme_minimal() +
      labs(
        x     = NULL,
        y     = t$global_y_label,
        title = t$ui_fair_title
      ) +
      theme(
        legend.position    = "none",
        text               = element_text(size = 14),
        panel.grid.major.x = element_blank()
      )
  })  
    
  # # Table showing raw frequency and percentage of prize locations
  output$fair_table <- renderTable({
    t <- i18n[[values$lang]]
    counts_raw <- as.numeric(values$prize_counts)
    tot <- sum(counts_raw)
    
    # Validation: Suppress table if no games have been played
    if (tot == 0) return(NULL)
    
    # Data Frame Construction with formatted percentages
    df_fair_t <- data.frame(
      "B" = paste(t$door, 1:3),
      "N" = as.integer(counts_raw),
      "P" = sprintf("%.1f%%", (counts_raw / tot) * 100),
      stringsAsFactors = FALSE
    )
    
    # Assign dynamic column names from dictionary Dynamic Column Names from dictionary
    colnames(df_fair_t) <- c(t$door, "N", "%")
    
    return(df_fair_t)
    
  }, align = 'c', bordered = TRUE, spacing = 'm')   
    

  # 12. LOCAL STATISTICS: CONFIDENCE INTERVALS (CONT.) -----------------------

  # Detailed comparison (for CIs)  table of "Stay" vs "Switch" strategies
  output$ci_table <- renderTable({
    # Validation: Hide if no data exists
    if (values$total == 0) return(NULL)
    
    t <- i18n[[values$lang]]
    
    # 1. Calculate Statistics for both strategies (calc_ci logic is expected to be in utils.R)
    res_stay <- calc_ci(
      values$wins_stay,
      values$wins_stay + values$losses_stay,
      values$ci_method,
      values$conf_level
    )
    res_swit <- calc_ci(
      values$wins_switch,
      values$wins_switch + values$losses_switch,
      values$ci_method,
      values$conf_level
    )
    
    # 2. Construct dynamic Confidence Interval header
    method_name <- ifelse(values$ci_method == "wilson", "Wilson", "Wald")
    ci_header <- paste0(
      t$table_ci, " ", 
      values$conf_level * 100, "% (", 
      method_name, ")"
    )
    
    # 3. Assemble table: Strategy | N | Wins | Losses | Pct | CI
    df <- data.frame(
      "Strategia" = c(t$strat_stay, t$strat_switch),
      "N" = as.integer(c(
        values$wins_stay + values$losses_stay,
        values$wins_switch + values$losses_switch
      )),
      "W" = as.integer(c(values$wins_stay, values$wins_switch)),
      "P" = as.integer(c(values$losses_stay, values$losses_switch)),
      "%" = c(
        sprintf("%.1f%%", res_stay$p),
        sprintf("%.1f%%", res_swit$p)
      ),
      "CI" = c(
        sprintf("[%.1f%% - %.1f%%]", res_stay$low, res_stay$high),
        sprintf("[%.1f%% - %.1f%%]", res_swit$low, res_swit$high)
      ),
      check.names = FALSE
    )
    
    # 4. Map Column Names from i18n dictionary for full localization
    colnames(df) <- c(
      t$table_strat,
      t$table_n,
      t$stat_win_abbr,
      t$stat_loss_abbr,
      t$table_pct,
      ci_header
    )
    
    return(df)
    
  }, striped = TRUE, bordered = TRUE, align = 'c', spacing = 'm')
  
  
  # 13. COMPARISON PLOT & RAW STATS ------------------------------------------
  
  # Main Win Rate Comparison Plot: Visualizes Success Probability with Confidence Intervals
  output$win_plot <- renderPlot({
    s_n <- values$wins_stay + values$losses_stay
    w_n <- values$wins_switch + values$losses_switch
    
    # 1. Validation: Exit early if no games have been played to avoid empty plots
    if (s_n + w_n == 0) return(NULL)
    
    # 2. Statistical Computation: Calculate CIs for both strategies (logic in utils.R)
    res_s <- calc_ci(values$wins_stay, s_n, values$ci_method, values$conf_level)
    res_w <- calc_ci(values$wins_switch, w_n, values$ci_method, values$conf_level)
    
    t <- i18n[[values$lang]]
    
    # 3. Data Preparation for ggplot2
    df <- data.frame(
      S = factor(c(t$strat_stay, t$strat_switch), levels = c(t$strat_stay, t$strat_switch)),
      P = c(res_s$p, res_w$p),
      low = c(res_s$low, res_w$low),
      high = c(res_s$high, res_w$high),
      has_wins = c(values$wins_stay > 0, values$wins_switch > 0)
    )
    
    # Smart Label Positioning: Place text inside the bar if tall enough, otherwise above it
    df$text_y <- ifelse(df$low > 15, df$low - 7, df$high + 5)
    df$text_color <- ifelse(df$low > 15, "white", "black")
    
    method_name <- ifelse(values$ci_method == "wilson", "Wilson Score", "Wald")
    
    # 4. Building the Visualization
    p <- ggplot(df, aes(x = S, y = P, fill = S)) + 
      geom_col(width = 0.5) +
      geom_text(
        aes(y = text_y, label = sprintf("%.1f%%", P), color = text_color),
        size = 5, fontface = "bold"
      ) +
      scale_color_identity() + 
      # Theoretical probability markers (33% and 66%)
      geom_hline(yintercept = c(33.3, 66.7), linetype = "dashed", alpha = 0.5) +
      labs(
        y = t$y_label, x = NULL,
        title = paste("CI:", values$conf_level * 100, "% (", method_name, ")")
      ) +
      ylim(0, 110) + 
      theme_minimal() + 
      theme(legend.position = "none")
    
    # 5. Error Bars: Render only if data supports intervals (prevents CI artifacts at zero)
    if (any(df$has_wins)) {
      p <- p + geom_errorbar(
        data = subset(df, has_wins),
        aes(ymin = low, ymax = high),
        width = 0.1, size = 1
      )
    }
    p
  })
  
  # Raw Text Statistics: Detailed summary for Sidebar or Tooltips
  # Formats raw counts and system settings into a clean multi-line string
  output$stats <- renderText({
    t <- i18n[[values$lang]]
    method_name <- ifelse(values$ci_method == "wilson", "Wilson Score", "Wald")
    
    sprintf(
      "%s: %d\n\n%s: %s:%d %s:%d\n%s: %s:%d %s:%d\n\n---\nMethod: %s\nLevel: %.0f%%\n---\nSounds: %s",
      t$total_label, values$total,
      t$strat_stay, t$stat_win_abbr, values$wins_stay, t$stat_loss_abbr, values$losses_stay,
      t$strat_switch, t$stat_win_abbr, values$wins_switch, t$stat_loss_abbr, values$losses_switch,
      method_name, values$conf_level * 100,
      ifelse(values$mute, "OFF", "ON")
    )
  })
  
  
 
  # 14. DYNAMIC DOOR UI GENERATOR -------------------------------------------
  
  # Factory function to generate UI for each door based on the current game state.
  # This ensures consistent behavior across all three doors (i = 1, 2, 3).
  render_door <- function(i) {
    renderUI({
      v <- values
      t <- i18n[[v$lang]]
      
      # Highlight if this door is currently selected
      sel <- (!is.null(v$initial_choice) && v$initial_choice == i)
      sty <- paste(
        "width:100%;height:200px;font-weight:bold;",
        if (sel) "border:6px solid #2c3e50;" else ""
      )
      
      # STAGE 1: Initial Selection Phase
      if (v$stage == "choose_initial") {
        actionButton(paste0("btn_", i), paste(t$door, i), 
                     class = "btn-primary", style = sty)
        
        # STAGE 2: Decision Phase (Stay or Switch)
      } else if (v$stage == "choose_final") {
        if (v$revealed == i) {
          # This door was opened by the host (Zonk)
          actionButton(paste0("btn_", i), 
                       HTML(paste0("<div style='font-size:4em;'>", v$zonk_symbol, "</div>ZONK!")),
                       class = "btn-danger", style = sty, disabled = TRUE)
        } else {
          # Active doors: highlight "Stay" vs "Switch"
          actionButton(
            paste0("btn_", i),
            if (v$initial_choice == i) t$strat_stay else t$strat_switch,
            class = if (v$initial_choice == i) "btn-warning" else "btn-success",
            style = sty
          )
        }
        
        # STAGE 3: Final Results (End of round)
      } else {
        res <- (v$prize == i)
        actionButton(
          paste0("btn_", i),
          if (res) HTML("<div style='font-size:4em;'>🏆🚗</div>")
          else HTML(paste0("<div style='font-size:4em;'>", v$zonk_symbol, "</div>ZONK!")),
          class = if (res) "btn-success" else "btn-danger",
          style = sty, disabled = TRUE
        )
      }
    })
  }
  
  # Map the generator function to individual UI output slots
  output$door1_ui <- render_door(1)
  output$door2_ui <- render_door(2)
  output$door3_ui <- render_door(3)
  
  # 15. DATA PERSISTENCE & SESSION CLEANUP -----------------------------------------
  # SECTION: SESSION CLEANUP & DATA EXPORT ----------------------------------
  
  # Automatically synchronize the local session buffer to Google Sheets upon exit.
  # This ensures that user gameplay data is preserved for global analysis.
  session$onSessionEnded(function() {
    # Use isolate() to safely read the reactive buffer outside of a reactive context
    data_to_save <- isolate(values$session_buffer)
    
    if (nrow(data_to_save) > 0) {
      # Data Integrity Check: Ensure 'prize_dist' column exists to match Sheet schema
      if (!"prize_dist" %in% names(data_to_save)) {
        data_to_save$prize_dist <- NA
      }
      
      # Silent Append: Attempt to push data to Google Sheets cloud storage.
      # Wrapped in try() to prevent app crashes if there are connectivity or Auth issues.
      try({
        googlesheets4::sheet_append(SHEET_ID, data_to_save)
      }, silent = TRUE)
    }
  })
} # Closing brace for the server function