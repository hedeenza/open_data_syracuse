library(tidyverse)
library(sf)

syracuse_water <- read_sf("Data/Water_Main_Breaks_(2021).geojson")

head(syracuse_water)


spanish_communes <- read_sf("communes.geojson")

# In the column "code", only grab the values where at positions 1 and 2, the characters match "06"
# Grab every column [selection_criteria, BLANK]
region_6 <- spanish_communes[substr(spanish_communes$code, 1, 2) == "06", ]

# Plotting with ggplot2
spanish_map <-
  ggplot(region_6) +
    geom_sf(fill = "#69b3a2", color = "white") +
    theme_void()

spanish_map
