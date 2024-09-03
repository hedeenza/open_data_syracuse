library(tidyverse)
library(gt)
library(gtExtras)

# Load in the data from open data Syracuse
data_set_list <- read_csv("Data/Cleaned_Inventory.csv")

# Examine the data categories with table()
data_categories <- 
  table(data_set_list$Category) |>
  as.data.frame() |>
  arrange(desc(Freq), Var1) 
  
# gt() table
gt(
  data_categories) #|>
  
  tab_header(
    title = "Data Set Types",
    subtitle = "from Open Data Syracuse") |>
  
  tab_source_note(
    source_note = "from https://data-syr.opendata.arcgis.com/pages/open-data-inventory") |>
  
  tab_footnote(
    footnote = "The number of data sets they had",
    locations = cells_body(columns = "Var1", rows = c(5))) |>
  
  gt_theme_nytimes()

