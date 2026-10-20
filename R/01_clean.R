# Clean raw ED observations
library(dplyr)
library(readr)

ed_raw <- read_csv("data/raw/ed_obs.csv", show_col_types = FALSE)

ed_clean <- ed_raw %>%
  distinct() %>%                          # remove duplicate rows
  filter(news2 >= 0, news2 <= 20) %>%     # NEWS2 can only be 0-20
  mutate(sex = factor(sex))
