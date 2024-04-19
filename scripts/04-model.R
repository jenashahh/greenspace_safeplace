#### Preamble ####
# Purpose: Models data.
# Author: Jena Shah
# Date: 02 April 2024
# Contact: jena.shah@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(rstanarm)

#### MAKE MODEL ####
# Read the cleaned data.
cleaned_par <- read_parquet("C:/Users/shahj/OneDrive/Documents/greencrimes/data/cleaned/cleaned_data.parquet") %>%
  filter(!is.na(TOTAL_CRIMES) & TOTAL_CRIMES != 0 & !is.na(Green.Spaces) & Green.Spaces != 0)

# Fit the gamma regression model.
model_total_crimes <- stan_glm(
  TOTAL_CRIMES ~ Green.Spaces,
  data = cleaned_par,
  family = Gamma,
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)

# Save the model.
saveRDS(model_total_crimes, "C:/Users/shahj/OneDrive/Documents/greencrimes/models/model.rds")