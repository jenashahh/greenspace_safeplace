#### Preamble ####
# Purpose: Tests the cleaned data.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT


#### Set up workspace ####
library(tidyverse)

#### Test data ####
# Start off with reading the csv.
cleaned_data <- read.csv("C:/Users/shahj/OneDrive/Documents/greencrimes/data/cleaned/cleaned_data.csv")

# Check if all crime rate variables are between 0 and 100000 (since they are the number of crimes per 100000).
all_cols <- c("ASSAULT_RATE_2023", "AUTOTHEFT_RATE_2023", "BREAKENTER_RATE_2023",
              "ROBBERY_RATE_2023", "THEFTOVER_RATE_2023", "TOTAL_CRIMES")
between_0_and_100000_check <- sapply(cleaned_data[all_cols], function(x) all(x >= 0 & x <= 100000, na.rm = TRUE))

# Check if the Green.Spaces column values are 0 or more.
green_spaces_check <- all(cleaned_data$Green.Spaces >= 0)

# Check if the HOOD_ID values are from 1 to 140.
hood_id_check <- all(cleaned_data$HOOD_ID %in% 1:140)

# Check if the AREA_NAME values are characters.
area_name_check <- all(sapply(cleaned_data$AREA_NAME, is.character))

# Combine all three tests.
all_checks <- all(between_0_and_100000_check, green_spaces_check, hood_id_check, area_name_check)

# Print result.
print(all_checks)