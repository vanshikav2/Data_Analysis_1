#### Preamble ####
# Purpose: Simulates the data of Persons in Crisis as per the Calls for Service Attended
# Author: Vanshika Vanshika
# Date: 18 January 2024
# Contact: vanshika.vanshika@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Simulate data ####
set.seed(398)

# Displays the 1000 simulations of the data's Event type,, if an apprehension 
# was made or not and the Toronto Hood 158 number the call is associated with
simulated_data <-tibble(
  "Event_id" = 1:1000,
  "Event_type" = sample(c("Suicide-related", "Person in Crisis", "Elopee", "Jumper", "Overdose", "Threaten Suicide"), 1000, replace = TRUE),
  "Apprehension_made" = sample(c("Yes", "No"), 1000, replace = TRUE),
  "Hood_158" = sample(100:200, 1000, replace = TRUE),
)

# find the frequency of calls of each event type
event_freq <- simulated_data %>%
  count(Event_type)

# Calculates the frequency of how many apprehension made 
event_freq <- simulated_data %>%
  count(Apprehension_made)


# Display our simulated data
simulated_data

# Display event frequency
event_freq


### Visualize data ###

#based on code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html #Explore

# Visualize event types and their frequencies
ggplot(simulated_data, aes(x = Event_type)) +
  geom_bar(fill = "pink") +
  labs(title = "Event Types and Their Frequencies", x = "Event Type", y = "Frequency", color = "Country") +
scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")


# Visualize event types based on neighborhoods
#ggplot(simulated_data, aes(x = Event_type, fill = NEIGHBOURHOOD)) +
#  geom_bar(position = "dodge") +
#  labs(title = "Event Types Based on Neighborhoods", x = "Event Type", y = "Frequency", fill = "Neighborhood")

# Visualize event type based on Hood_158 while using the stack formation
ggplot(simulated_data, aes(x = Event_type, fill = factor(Hood_158))) +
  geom_bar(position = "stack") +
  labs(title = "Event Type Based on Hood_158", x = "Event Type", y = "Frequency", fill = "Hood_158")

# Visualize event type based on Hood_158 while using the dodge formation
ggplot(simulated_data, aes(x = Event_type, fill = factor(Hood_158))) +
  geom_bar(position = "dodge") +
  labs(title = "Event Type Based on Hood_158", x = "Event Type", y = "Frequency", fill = "Hood_158")

# Visualize event types based on if the apprehension was made
ggplot(simulated_data, aes(x = Event_type, fill = Apprehension_made)) +
  geom_bar(position = "dodge", fill = 'red') +
  labs(title = "Event Types Based on Apprehension Made", x = "Event Type", y = "Frequency", fill = "Apprehension Made")

