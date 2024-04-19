#### Preamble ####
# Purpose: Cleans the green spaces and crime rates data and merges them.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT

#### Set up workspace ####
library(dplyr)
library(arrow)

#### Merge raw data ####
# Start off with reading raw data.
crime_data <- read.csv("C:/Users/shahj/OneDrive/Documents/greencrimes/data/raw/crime_data.csv")
green_data <- read.csv("C:/Users/shahj/OneDrive/Documents/greencrimes/data/raw/green_data.csv")

# We want to combine crime_data's HOOD_ID and green_data's Neighbourhood.Id.
combined_data <- merge(crime_data, green_data, by.x = "HOOD_ID", by.y = "Neighbourhood.Id")

#### Clean data ####
# Filter out variables being used.
keep_cols <- c("HOOD_ID", "AREA_NAME", "ASSAULT_RATE_2023", "AUTOTHEFT_RATE_2023",
               "BREAKENTER_RATE_2023", "ROBBERY_RATE_2023", "THEFTOVER_RATE_2023", 
               "Green.Spaces")

filtered_data <- combined_data %>% 
  select(all_of(keep_cols))

# Add a column for total crimes per neighborhood.
filtered_data <- combined_data %>% 
  select(all_of(keep_cols)) %>%
  mutate(
    TOTAL_CRIMES = ASSAULT_RATE_2023 + AUTOTHEFT_RATE_2023 + BREAKENTER_RATE_2023 + ROBBERY_RATE_2023 + THEFTOVER_RATE_2023,
    TOTAL_CRIMES = replace_na(TOTAL_CRIMES, 0)
  )
#### Save data ####
# Save as a csv.
write.csv(filtered_data, "C:/Users/shahj/OneDrive/Documents/greencrimes/data/cleaned/cleaned_data.csv", row.names=FALSE)
# Save as a parquet.
write_parquet(filtered_data, "C:/Users/shahj/OneDrive/Documents/greencrimes/data/cleaned/cleaned_data.parquet")