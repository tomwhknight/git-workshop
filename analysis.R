library(dplyr)
library(ggplot2)

# Toy data: simulated ED observations, no real patients
set.seed(42)
obs <- tibble(
  patient_id = 1:200,
  news2 = rpois(200, lambda = 3),
  lactate = round(rlnorm(200, meanlog = 0.3, sdlog = 0.5), 1)
)

# Flag patients for sepsis review
sepsis_flag <- obs |>
  filter(news2 >= 5)

nrow(sepsis_flag)

# Plot NEWS2 distribution
ggplot(obs, aes(x = news2)) +
  geom_bar() +
  labs(title = "NEWS2 scores")
