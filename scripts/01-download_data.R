#### Preamble ####
# Purpose: Downloads and saves the data.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# Download data from opendatatoronto (1) wellbeing-toronto-environment (2) neighbourhood-crime-rates.
# Download (1) as the_green_spaces and (2) as the_crime_rates.

#### Save data ####
write_csv(the_crime_rates, "inputs/data/crime_rates.csv") 
write_csv(the_green_spaces, "inputs/data/green_spaces.csv")

         
