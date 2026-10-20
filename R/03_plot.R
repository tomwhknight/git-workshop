# Plot NEWS2 distribution, highlighting flagged attendances
library(dplyr)
library(ggplot2)
source("R/02_analysis.R")

ed_plot <- ed_clean |>
  mutate(flagged = attendance_id %in% sepsis_flag$attendance_id)

p <- ggplot(ed_plot, aes(x = news2, fill = flagged)) +
  geom_bar() +
  labs(
    title = "NEWS2 scores",
    x     = "NEWS2 score",
    y     = "Attendances",
    fill  = "Flagged for review"
  ) +
  theme_minimal()

print(p)
