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

# cleans the data to include event type and hood_158 number
raw_data
cleaned_data_1<-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_type, hood_158) |>
  filter(hood_158 != "NSA") |>
  rename(hood_158_loc = hood_158
         ) |> 
  tidyr::drop_na()

# create cleaned dataset that contains all the dates from year 2014 
cleaned_data_2 <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_year, event_month, event_dow, event_type) |>
  filter(event_year == "2014") |>
  tidyr::drop_na()

# create another cleaned dataset that contains all the dates from year 2023
cleaned_data_3 <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_year, event_month, event_dow, event_type) |>
  filter(event_year == "2023") |>
  tidyr::drop_na()

# create cleaned dataset that contains all the dates and event type 
cleaned_data_4 <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_year, event_month, event_dow,event_hour, event_type, 
         apprehension_made) |>
  tidyr::drop_na()

# create cleaned dataset that contains all the hood_158_loc of Suicides
event_suicide_data <-
  raw_data |>
  janitor::clean_names() |>
  select(objectid, event_type, hood_158) |>
  filter(event_type == "Suicide-related" & hood_158 != "NSA") |>
  tidyr::drop_na()

event_suicide_data2 <-
raw_data |>
  janitor::clean_names() |>
  select(objectid, event_month, event_dow, event_hour, event_type) |>
  filter(event_type == "Suicide-related") |>
  tidyr::drop_na()
print(event_suicide_data2)

#### Save data ####
write_csv(cleaned_data_1, "outputs/data/analysis_data_hood158.csv")
write_csv(cleaned_data_2, "outputs/data/analysis_data_2014.csv")
write_csv(cleaned_data_3, "outputs/data/analysis_data_2023.csv")
write_csv(cleaned_data_4, "outputs/data/analysis_data_full.csv")
write_csv(event_suicide_data, "outputs/data/suicide_data.csv")
write_csv(event_suicide_data2, "outputs/data/suicide_data1.csv")

