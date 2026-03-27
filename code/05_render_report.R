here::i_am("code/05_render_report.R")

library(rmarkdown)
render("DATA550final.Rmd")
output_file = here::here ("DATA550finalreport.Rmd")