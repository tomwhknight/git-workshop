library(dplyr)
library(readr)

# Raw data
ed_raw <- read_csv("data/raw/ed_obs.csv", show_col_types = FALSE)
glimpse(ed_raw)
summary(ed_raw)


# Explore
sum(duplicated(ed_raw))        
sum(ed_raw$news2 > 20)        
mean(is.na(ed_raw$lactate))    

# Thresholds
ed_clean %>% count(news2 >= 5)
ed_clean %>% count(news2 >= 7)
ed_clean %>% count(news2 >= 5 | lactate >= 2)
