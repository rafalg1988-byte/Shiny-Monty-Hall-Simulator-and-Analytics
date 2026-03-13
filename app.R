# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# License: All rights reserved © 2026.
# ==============================================================================

# Global Configuration:
source("global.R")
# Part: Utilities (Helper Functions & Statistics)
source("R/utils.R")
# Part: Static Contents (Texts & Translations)
source("R/texts.R") # <--- TUTAJ
# User interface:
source("ui.R")
# User interface:
source("server.R")


# 8. DATA PERSISTENCE & APP LAUNCH -----------------------------------------
shinyApp(ui, server)