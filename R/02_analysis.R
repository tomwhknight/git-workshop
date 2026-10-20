# Flag attendances for sepsis review
library(dplyr)
source("R/01_clean.R")

sepsis_flag <- ed_clean %>%
  filter(news2 >= 5)

n_flagged   <- nrow(sepsis_flag)
pct_flagged <- round(100 * n_flagged / nrow(ed_clean), 1)

message(n_flagged, " of ", nrow(ed_clean),
        " attendances flagged (", pct_flagged, "%)")
