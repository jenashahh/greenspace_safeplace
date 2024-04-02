#### Preamble ####
# Purpose: Models data.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
# Model here assigned to my_model

#### Save model ####
saveRDS(
  my_model,
  file = "models/my_model.rds"
)


