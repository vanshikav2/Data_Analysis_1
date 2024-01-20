#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto portal
# Author: Vanshika Vanshika
# Date: 18 January 2024
# Contact: vanshika.vanshika@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)

#### Download data ####
# Got the data from opendatatoronto
#code based from https://open.toronto.ca/dataset/persons-in-crisis-calls-for-service-attended/ 
# get package
package <- show_package("persons-in-crisis-calls-for-service-attended")
package

# get all resources for this package
resources <- list_package_resources("persons-in-crisis-calls-for-service-attended")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data
dim(data)

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data, "inputs/data/raw_data.csv") 

         
