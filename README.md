# DATA550 Final Project

In this project, we build a fully reproducible data analysis pipeline using R, R Markdown, and a Makefile. The goal is to analyze a dataset of deaths and causes of death across countries, generate summary tables and figures, and produce a final report.

The workflow is designed so that all results can be reproduced from raw data using a single command.

---

## Project Workflow

The analysis follows a step-by-step pipeline:

1. The raw dataset is read and cleaned
2. Summary tables are created from the cleaned data
3. Figures are generated to visualize patterns in the data
4. A final report is rendered using R Markdown

Each step is implemented in a separate script and through a Makefile.

---

## Code Workflow

The project is organized into modular scripts, each responsible for a specific step in the analysis pipeline:

`code/data.R`
- read raw data from project directory
- save cleaned data to `output/clean_data.rds`

`code/01_make_table.R`
- read cleaned data from `output/clean_data.rds`
- create summary table of total deaths per country
- save table to `output/table1.rds`

`code/02_make_table.R`
- read cleaned data from `output/clean_data.rds`
- create table of most common cause of death per country
- save table to `output/table2.rds`

`code/03_make_graph.R`
- read cleaned data from `output/clean_data.rds`
- generate first visualization
- save figure to `output/graph1.png`


`code/04_render_report.R`
- render `DATA550final.Rmd`
- save compiled report as `report.html`

`DATA550final.Rmd`
- read cleaned data, tables, and figures from `output/`
- display formatted tables and figures
- produce final report



## How to Generate the Final Report

To generate the final report (`DATA550final.html`), navigate to the project directory and run:


make DATA550final.html




## This project uses renv to manage R package dependencies: to use Install Renv

To restore packages, navigate to the terminal and run 

make install 



## To use Docker
 
To build the image, run 

  docker build -t final5 .
  
  
  
To run the image using make, run 

  make report/DATA550final.html
  
  
  
To run the container directly at the command line, run

  docker run -v "$(pwd)/report:/home/rstudio/project/report" final5
  

 