# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# License: All rights reserved © 2026.
# Part: Global Configuration (global.R)
# ==============================================================================

# 1. DEPENDENCIES --------------------------------------------------------------
library(shiny)
library(shinythemes)
library(ggplot2)
library(googlesheets4)


# 2. GOOGLE SHEETS CONFIGURATION -----------------------------------------------
# Fetch credentials and IDs from environment variables for security.
# Ensure the .secrets folder is present in the app directory for deployment.
user_email      <- Sys.getenv("MY_GS_EMAIL")
target_sheet_id <- Sys.getenv("MY_SHEET_ID")

# Non-interactive authentication for hosting environments (e.g., shinyapps.io)
gs4_auth(cache = ".secrets", email = user_email)
SHEET_ID <- target_sheet_id


# 3. UI ASSETS & STATIC ELEMENTS ----------------------------------------------
# Common UI elements used across multiple tabs
author_sign <- tags$div(style = "text-align: right; font-size: 0.9em; color: #777; font-style: italic; margin-top: 40px; padding-right: 10px;", "© Rafał Gardian")



# NOTE: Statistical functions (like calc_ci) are located in R/utils.R. Texts & Translations (static contents) used in application are located in R/texts.r

