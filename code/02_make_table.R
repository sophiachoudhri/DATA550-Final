here::i_am("code/02_make_table.R")

library(gt)

common_cause <- data |>
  group_by(Country, Cause_of_Death) |>
  summarise(
    total_deaths = sum(Number_of_Deaths, na.rm = TRUE),
    .groups = "drop"
  ) |>
  group_by(Country) |>
  slice_max(total_deaths, n = 1, with_ties = FALSE) |>
  ungroup() |>
  gt() |>
  cols_label(
    Country = "Country",
    Cause_of_Death = "Most Common Cause of Death",
    total_deaths = "Total Number of Deaths"
  ) |>
  fmt_number(
    columns = total_deaths,
    decimals = 0,
    use_seps = TRUE
  ) |>
  tab_header(
    title = "Most Common Cause of Death by Country"
  )

saveRDS(common_cause, 
        file= here::here("output/table2.rds"))