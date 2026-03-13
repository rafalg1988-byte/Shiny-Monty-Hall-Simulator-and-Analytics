# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# License: All rights reserved © 2026.
# Part: User interface (ui.R)
# ==============================================================================




ui <- navbarPage(
  title = textOutput("ui_title"),
  windowTitle = "Monty Hall Paradox | by Rafał Gardian 🐈",
  theme = shinythemes::shinytheme("flatly"),
  id = "main_nav",
  
  # HTML Header & Custom Assets ------------------------------------------------
  header = tags$head(
    # 1. External Styles & Fonts
    # Custom CSS styles are loaded from www/styles.css for a professional look
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    # Google Fonts: Lato (Regular, Bold, Extra-Bold)
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Lato:wght@400;700;800&display=swap"),
    
    # 2. Metadata & SEO
    # Author information for transparency and SEO
    tags$meta(name = "author", content = "Rafał Gardian"),
    # Dynamic Favicon (the small cat icon in the browser tab) using inline SVG
    tags$link(rel = "icon", href = "data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>🐈</text></svg>"),
    
    # 3. Mathematical Rendering
    # Enables LaTeX support for formulas (useful in 'Science & History' tab)
    withMathJax(),
    
    # 4. JavaScript Handlers
    # Sound effect handler
    tags$script(
      HTML(
        "
      Shiny.addCustomMessageHandler('play_sound', function(m){
        var a=document.getElementById(m.id);
        if(a){a.pause(); a.currentTime=0; a.play();}
      });
    "
      )
    ),  # Settings Toggle ------------------------------------------------------------
    div(
      class = "settings-btn",
      actionButton("show_settings", "⚙", class = "btn-default")
    )
  ),
  

  
  # TAB 1: GAME INTERFACE ------------------------------------------------------
  tabPanel(
    textOutput("ui_tab_game"),
    # Audio Assets
    tags$audio(id = "sound_click", src = "click.wav"),
    tags$audio(id = "sound_win", src = "win.wav"),
    tags$audio(id = "sound_loss", src = "loss.wav"),
    
    # Game Logic Display
    fluidRow(column(
      12, wellPanel(
        h3(textOutput("info"), style = "text-align:center; color:#c0392b; font-weight:bold; min-height:80px;"),
        br(),
        fluidRow(
          column(4, uiOutput("door1_ui"), align = "center"),
          column(4, uiOutput("door2_ui"), align = "center"),
          column(4, uiOutput("door3_ui"), align = "center")
        ),
        br(),
        div(
          style = "text-align:center;",
          actionButton("next_round", textOutput("btn_again"), class =
                         "btn-info btn-lg"),
          br(),
          br(),
          span(textOutput("ui_sim_label"), style = "font-weight:bold; margin-right:10px;"),
          actionButton("sim10", "+10", class = "btn-warning"),
          actionButton("sim100", "+100", class = "btn-warning"),
          actionButton("sim1000", "+1000", class = "btn-warning"),
          actionButton(
            "reset_all",
            textOutput("btn_reset"),
            class = "btn-danger btn-sm",
            style = "margin-left:10px;"
          )
        )
      )
    )),
    
    # Real-time Statistics
    fluidRow(column(
      12,
      h3(textOutput("ui_stats_title")),
      fluidRow(column(5, wellPanel(
        verbatimTextOutput("stats")
      )), column(
        7, plotOutput("win_plot", height = "300px")
      )),
      br(),
      tableOutput("ci_table")
    ))
  ),
  
  # TAB 2: HOW TO PLAY ---------------------------------------------------------
  tabPanel(
    textOutput("ui_tab_how"),
    column(10, offset = 1, h2(textOutput("ui_tab_how_h")), wellPanel(
      p(textOutput("ui_how_text"), style = "font-size:1.2em;")
    ))
  ),
  
  # TAB 3: FAIRNESS (Randomness check) -----------------------------------------
  tabPanel(
    textOutput("ui_tab_fair"),
    column(
      10,
      offset = 1,
      h3(textOutput("ui_fair_title")),
      p(textOutput("ui_fair_desc")),
      p(textOutput("ui_fair_extra")),
      plotOutput("fair_plot"),
      br(),
      div(style = "display: flex; justify-content: center;", tableOutput("fair_table")),
      br(),
      div(style = "clear: both; width: 100%; margin-top: 20px;", p(textOutput("ui_fair_extra2"))),
      plotOutput("global_fair_plot"),
      br(),
      div(style = "display: flex; justify-content: center;", tableOutput("global_fair_table"))
    )
  ),
  
  # TAB 4: SCIENCE & HISTORY ---------------------------------------------------
  tabPanel(
    textOutput("ui_tab_science"),
    column(
      10,
      offset = 1,
      class = "science-container",
      uiOutput("science_content")
    )
  ),
  
  # APP FOOTER -----------------------------------------------------------------
  footer = tags$div(
    class = "footer-style",
    hr(),
    textOutput("ui_author", inline = TRUE),
    actionLink("info_btn", icon("info-circle"))
  )
)