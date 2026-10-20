# Have a look at the data. Run line by line with Cmd + Enter.
# Not part of the pipeline: nothing else depends on this file.

library(dplyr)
library(readr)

# The raw data, as it arrived
ed_raw <- read_csv("data/raw/ed_obs.csv", show_col_types = FALSE)
glimpse(ed_raw)
summary(ed_raw)

# What's wrong with it?
sum(duplicated(ed_raw))        # duplicate rows
sum(ed_raw$news2 > 20)         # impossible NEWS2 scores
mean(is.na(ed_raw$lactate))    # proportion with no lactate measured

# After cleaning
source("R/01_clean.R")
nrow(ed_raw)
nrow(ed_clean)

# How many would each rule flag?
ed_clean |> count(news2 >= 5)
ed_clean |> count(news2 >= 7)
ed_clean |> count(news2 >= 5 | lactate >= 2)
