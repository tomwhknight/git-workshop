library(dplyr)
library(readr)

# Raw data
ed_raw <- read_csv("data/raw/red_bobs.csv", show_col_types = FALSE)
glimpse(ed_raw)
summary(ed_raw)


# Explore
sum(duplicated(ed_raw))        
sum(ed_raw$news2 > 20)        
mean(is.na(ed_raw$lactate))    

# check missing data in all columns
apply(ed_raw, 2, function(x) sum(is.na(x)))

# replace missing lactate values with 0
ed_clean <- ed_raw
ed_clean$lactate[is.na(ed_clean$lactate) == TRUE] <- 0

# Thresholds
ed_clean %>% count(news2 >= 5)
ed_clean %>% count(news2 >= 7)
ed_clean %>% count(news2 >= 5 | lactate >= 2)
