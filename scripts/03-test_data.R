#### Preamble ####
# Purpose: Tests all cases of the simulation and data_cleaning.
# Author: Vanshika Vanshika
# Date: 19 January 2024
# Contact: vanshika.vanshika@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data

#### Workspace setup ####
library(tidyverse)
library(dplyr)
#### Test data ####

# get the data from 00-simulate_data to test
source("scripts/00-simulate_data.R")
source("scripts/02-data_cleaning.R")


# check that there is max of 6 event types
# reference from r bloggers: https://www.r-bloggers.com/2022/06/how-to-count-distinct-values-in-r/ 
num_unique <- n_distinct(simulated_data$Event_type)
 num_unique |> max() == 6

# check the hood_158 is max 200 and min 100 
simulated_data$Hood_158 |> min() == 100
simulated_data$Hood_158 |> max() == 200

# check in the cleaned data that there are 5 columns
num_col = ncol(cleaned_data)
num_col == 5
