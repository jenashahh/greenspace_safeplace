#### Preamble ####
# Purpose: Downloads and saves the data.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT

#### Set up workspace ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# We want two datasets. (1) Green Spaces and (2) Crime Rates.
# Green Spaces dataset: data was manually downloaded from Toronto's Open Data Catalogue (cited in references) as green_data.csv.

# Crime Rates dataset: use the code provided on https://open.toronto.ca/dataset/neighbourhood-crime-rates/.
package <- show_package("neighbourhood-crime-rates")
resources <- list_package_resources("neighbourhood-crime-rates")
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
crime_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
write.csv(crime_data, "C:/Users/shahj/OneDrive/Documents/greencrimes/data/raw/crime_data.csv", row.names = FALSE)