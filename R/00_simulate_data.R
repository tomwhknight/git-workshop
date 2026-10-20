# Creates synthetic ED observation data. No real patients.
# Run once; the CSV it writes is committed to the repo.

library(dplyr)
library(readr)

set.seed(2026)
n <- 500

ed_obs <- tibble(
  attendance_id = sprintf("ED%04d", 1:n),
  arrival_time  = as.POSIXct("2026-01-01 00:00", tz = "Europe/London") +
                    sort(runif(n, 0, 60 * 60 * 24 * 90)),
  age           = round(rnorm(n, mean = 58, sd = 20)),
  sex           = sample(c("F", "M"), n, replace = TRUE),
  news2         = rpois(n, lambda = 3),
  lactate       = round(rlnorm(n, meanlog = 0.3, sdlog = 0.5), 1)
)

# Add realistic messiness for the cleaning script to deal with
ed_obs <- ed_obs %>%
  mutate(
    age     = pmin(pmax(age, 18), 100),
    lactate = if_else(runif(n) < 0.4, NA_real_, lactate),
    news2   = if_else(runif(n) < 0.02, 99L, news2)
  )

ed_obs <- bind_rows(ed_obs, slice_sample(ed_obs, n = 10))

write_csv(ed_obs, "data/raw/ed_obs.csv")
