# 🚪 Monty Hall Simulator: A Statistical Approach

Professional Shiny application designed to simulate and analyze the famous **Monty Hall Problem**. This tool combines interactive gameplay with real-time Monte Carlo simulations and statistically sound inference through confidence intervals.

---

## 🚀 Quick Start (How to run this project)

1. **Clone the repository** to your local machine.
2. Ensure you have the required **R packages** installed. Run this command in your R console:

   ```r install.packages(c("shiny", "shinythemes", "ggplot2", "googlesheets4"))
   ```
   
3. Open the project in **RStudio**.
4. Open `app.R` and click the **"Run App"** button at the top of the editor.

---

## 📊 Features

### 🎮 Interactive Game
Experience the classic game show scenario. The app allows users to **empirically verify** the paradox through direct gameplay by **collecting, tabulating, and analyzing real-time statistics** of "Stay" vs "Switch" strategies.

### 🧪 Science & Statistics
* **Monte Carlo Engine**: Instantly run up to 1000 simulations to see the Law of Large Numbers in action. This provides a robust empirical confirmation of the 2/3 win probability when switching.
* **Mathematical Proof**: A dedicated educational section within the app provides a rigorous step-by-step mathematical derivation of the paradox, bridging the gap between intuition and theory.
* **Confidence Intervals**: Real-time statistical significance testing using Wilson Score or Wald methods.
* **Visual Analysis**: Dynamic ggplot2 visualizations showing the convergence of results as the number of trials increases.

---

## 📂 Project Structure

```text
├── .gitignore              # Files ignored by Git (secrets, local logs)
├── LICENSE                 # Usage terms and copyright
├── README.md               # Project documentation and data schema
├── Monty_Hall_App.Rproj    # RStudio project file
├── app.R                   # Application entry point
├── ui.R                    # User Interface definitions
├── server.R                # Server-side logic and calculations
├── global.R                # Global settings and API connections
├── R/                      # Modular R scripts
│   ├── utils.R             # Helper functions (math & backend)
│   └── texts.R             # UI text constants and translations
└── www/                    # Static assets
    ├── styles.css          # Custom CSS styling
    └── *.wav               # Audio assets (click, win, loss)
```

---


## 🔐 Data Persistence & Security

The application is integrated with **Google Sheets API** via the `googlesheets4` package to collect global statistics.

### Google Sheets Schema
The application logs every event to a central database. For simulations, data is aggregated to optimize performance.

| Column Name | Description | Example Values |
| :--- | :--- | :--- |
| `timestamp` | Date and time of the event | `2026-03-12 14:30:05` |
| `strategy` | Chosen strategy or action type | `stay`, `switch`, `simulation`, `RESET_ACTION` |
| `result` | Outcome or simulation summary | `Win`, `Loss`, `St:179/491 \| Sw:329/509`* |
| `type` | Source of the event | `User`, `Sim_10`, `Sim_100`, `Sim_1000` |
| `session_id` | Unique identifier for the user session | `7a6077d2...` |
| `prize_dist` | Prize distribution or summary | `Door 2`, `B1:35 \| B2:32 \| B3:33`** |

---

#### * Simulation Result Legend (`St:W/T | Sw:W/T`)
* **St (Stay)**: `179/491` means 179 wins out of 491 games where the "Stay" strategy was randomly assigned.
* **Sw (Switch)**: `329/509` means 329 wins out of 509 games where the "Switch" strategy was randomly assigned.

#### ** Prize Distribution Legend (`B1:X | B2:Y | B3:Z`)
* Shows how many times the prize (Car) was hidden behind **Door 1 (B1)**, **Door 2 (B2)**, and **Door 3 (B3)** during the entire simulation run.

* **Authentication**: For security reasons, the `.secrets/` directory and `.Renviron` file are **not included** in this repository.
* **Local Run**: The app includes a fallback mechanism. If the Google Sheet is unavailable or credentials are missing, it will switch to a local session-based data frame to ensure the app remains functional for review.

### 💡 Analytical Potential
The granular logging of every interaction (including `RESET_ACTION` and `session_id`) is designed not just for statistics, but for **User Behavior Analysis**:
* **Strategy Consistency**: Analyzing whether users tend to stick to one strategy or change it after a loss.
* **Engagement Metrics**: Tracking the number of manual games vs. large-scale simulations per session.
* **UX Auditing**: Using reset logs and session timestamps to identify potential points of friction in the application flow.

---

## ⚖️ License & Credits

* **Author**: Rafał Gardian
* **Project**: Monty Hall Paradox - Simulator & Statistical Analysis
* **Copyright**: © 2026 Rafał Gardian. All Rights Reserved.

---

### Usage Terms
This repository is published for **demonstration and portfolio review purposes only**. 

* **Permission**: You are granted permission to download and run this application locally for personal, educational, and evaluative purposes.
* **Prohibitions**: You may **not** copy, modify, merge, publish, distribute, or sell the source code, UI design, or any assets of this project without express written permission from the author.

For inquiries regarding commercial licensing or collaboration, please contact me via [LinkedIn](https://www.linkedin.com/in/rafa%C5%82-gardian-127a041b3/).