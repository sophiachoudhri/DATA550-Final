
DATA550final.html: DATA550final.Rmd code/04_render_report.R output/table1.rds output/table2.rds output/graph1.png 
	Rscript code/04_render_report.R

output/clean_data.rds: code/data.R deaths_and_causes_synthetic.csv
	Rscript code/data.R

output/table1.rds: code/01_make_table.R output/clean_data.rds
	Rscript code/01_make_table.R

output/table2.rds: code/02_make_table.R output/clean_data.rds
	Rscript code/02_make_table.R

output/graph1.png: code/03_make_graph.R output/clean_data.rds
	Rscript code/03_make_graph.R

PHONY:
clean:
	rm -f output/*.rds output/*.png report.html

# For renv:

PHONY:
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
	
# For docker: 

PROJECTFILES = DATA550final.Rmd code/data.R code/01_make_table.R code/02_make_table.R code/03_make_graph.R code/04_render_report.R Makefile Dockerfile
RENVFILES = renv.lock renv/activate.R renv/settings.json

final5: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final5 .
	touch $@

report/DATA550final.html: final5
	docker run -v "$$(pwd)/report:/home/rstudio/project/report" schoudhri/data550final:latest
