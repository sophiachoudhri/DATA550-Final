here::i_am("code/01_make_table.R")

library(dplyr)
library(gt)
library(here)

deaths_country <- data |>
  group_by(Country) |>
  summarise(
    total_deaths = sum(Number_of_Deaths, na.rm = TRUE)
  ) |>
  arrange(desc(total_deaths)) |>
  gt() |>
  cols_label(
    Country = "Country",
    total_deaths = "Total Number of Deaths"
  ) |>
  fmt_number(
    columns = total_deaths,
    decimals = 0,
    use_seps = TRUE
  ) |>
  tab_header(
    title = "Total Number of Deaths per Country"
  )


saveRDS(deaths_country, 
        file= here::here("output/table1.rds"))