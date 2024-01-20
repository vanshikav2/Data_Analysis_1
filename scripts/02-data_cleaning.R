#### Preamble ####
# Purpose: Cleans the raw data into the specific columns needed
# Author: Vanshika Vanshika
# Date: 18 January 2024
# Contact: vanshika.vanshika@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

# cleans the data to include event_dow, type, if apprehension was made and their
# hood_158 number

raw_data
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_dow, event_type, apprehension_made, hood_158) |>
  filter(hood_158 != "NSA") |>
  rename(hood_158_loc = hood_158
         ) |> 
  tidyr::drop_na()

# create another cleaned dataset that contains all the dates and event type 
cleaned_dated_data <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_year, event_month, event_dow, event_type) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
write_csv(cleaned_dated_data, "outputs/data/date_analysis_data.csv")
