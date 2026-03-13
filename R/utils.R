# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# Part: Utilities & Helper Functions (Externalized Logic)
# ==============================================================================

# SECTION 1: STATISTICS & MATHEMATICS -----------------------------------------

#' Calculate Confidence Interval for Win Rate
#' @description Computes the estimated probability and error margins for game results.
#' @param wins Integer. Number of successful trials.
#' @param total Integer. Total number of trials.
#' @param method Character. "wilson" (preferred for binomial) or "wald" (standard).
#' @param conf_level Numeric. Confidence level (default 0.95).
#' @return A list containing percentage estimate (p), lower bound, and upper bound.
calc_ci <- function(wins, total, method = "wilson", conf_level = 0.95) {
  if (total <= 0) return(list(p = 0, low = 0, high = 0))
  
  p <- wins / total
  alpha <- 1 - conf_level
  z <- qnorm(1 - alpha / 2)
  
  if (method == "wald") {
    # Standard Wald Interval (Normal approximation)
    se <- sqrt(p * (1 - p) / total)
    low <- max(0, p - z * se)
    high <- min(1, p + z * se)
  } else {
    # Wilson Score Interval (More robust for proportions near 0 or 1)
    denom <- 1 + z^2 / total
    center <- (p + z^2 / (2 * total)) / denom
    spread <- (z * sqrt(p * (1 - p) / total + z^2 / (4 * total^2))) / denom
    low <- max(0, center - spread)
    high <- min(1, center + spread)
  }
  
  return(list(p = p * 100, low = low * 100, high = high * 100))
}

# SECTION 2: MULTIMEDIA HANDLERS ----------------------------------------------

#' Trigger Sound Effects via JavaScript
#' @description Sends a custom message to the UI to play an audio element.
#' @param id Character. The HTML id of the audio tag (e.g., "sound_win").
#' @param mute Boolean. Suppression flag usually pulled from values$mute.
trigger_sound <- function(id, mute = FALSE) {
  if (!mute) {
    # Dynamically find the active user session domain
    session <- shiny::getDefaultReactiveDomain()
    if (!is.null(session)) {
      session$sendCustomMessage("play_sound", list(id = id))
    }
  }
}

# SECTION 3: TEXT & TYPOGRAPHY ------------------------------------------------

#' Polish Typography Orphan Fixer
#' @description Prevents single-letter prepositions from hanging at the end of lines.
#' @param text Character string to process.
#' @return HTML-safe string with &nbsp; (non-breaking spaces).
fix_orphans <- function(text) {
  # Regex: look for single characters (i, a, o, u, w, z) surrounded by spaces
  fixed <- gsub(" ([iaouwzIAOUWZ]) ", " \\1&nbsp;", text)
  return(shiny::HTML(fixed))
}

# SECTION 4: SIMULATION ENGINE ------------------------------------------------

#' Mass Monte Carlo Simulation Engine
#' @description Simulates multiple Monty Hall games with randomized strategies.
#' @param n Integer. Number of iterations to perform.
#' @param values The reactiveValues object (passed by reference for direct updates).
#' @param session The Shiny session object (required for tracking user tokens).
run_sim <- function(n, values, session) {
  # 1. Initialize local counters for this specific batch log
  s_w <- 0; s_t <- 0  # Stay strategy: wins / total
  w_w <- 0; w_t <- 0  # Switch strategy: wins / total
  local_prizes <- c("1" = 0, "2" = 0, "3" = 0) 
  
  # 2. Main Simulation Loop
  for (i in 1:n) {
    p    <- sample(1:3, 1) # Randomized prize location
    init <- sample(1:3, 1) # Simulated initial player choice
    
    # Track global prize distribution for randomness fairness check
    values$prize_counts[as.character(p)] <- values$prize_counts[as.character(p)] + 1
    local_prizes[as.character(p)]        <- local_prizes[as.character(p)] + 1
    
    # Assign strategy based on a 50/50 probability split
    if (runif(1) < 0.5) {
      s_t <- s_t + 1
      if (init == p) {
        values$wins_stay <- values$wins_stay + 1
        s_w <- s_w + 1
      } else {
        values$losses_stay <- values$losses_stay + 1
      }
    } else {
      w_t <- w_t + 1
      if (init != p) {
        values$wins_switch <- values$wins_switch + 1
        w_w <- w_w + 1
      } else {
        values$losses_switch <- values$losses_switch + 1
      }
    }
  }
  
  # 3. Format results for the Session Data Buffer
  sim_result_string <- sprintf("St:%d/%d | Sw:%d/%d", s_w, s_t, w_w, w_t)
  sim_prize_dist    <- sprintf("B1:%d | B2:%d | B3:%d", 
                               local_prizes["1"], local_prizes["2"], local_prizes["3"])
  
  # 4. Push to RAM Buffer for eventual Cloud Sync (Google Sheets)
  sim_entry <- data.frame(
    timestamp  = Sys.time(),
    strategy   = "Simulation",
    result     = sim_result_string,
    type       = paste0("Sim_", n),
    session_id = session$token,
    prize_dist = sim_prize_dist,
    stringsAsFactors = FALSE
  )
  
  values$session_buffer <- rbind(values$session_buffer, sim_entry)
  values$total          <- values$total + n
}