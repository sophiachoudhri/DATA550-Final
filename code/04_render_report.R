here::i_am("code/04_render_report.R")

library(rmarkdown)
library(here)

rmarkdown::render(
  input = here("DATA550final.Rmd"),
  output_file = here("DATA550final.html")
)