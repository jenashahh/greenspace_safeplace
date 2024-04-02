#### Preamble ####
# Purpose: Cleans the green spaces and crime rates data and merges them.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/plane_data.csv")

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
