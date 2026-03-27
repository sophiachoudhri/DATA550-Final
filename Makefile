
DATA550final.html: DATA550final.Rmd code/05_render_report.R output/table1.rds output/table2.rds output/graph1.png output/graph2.png
	Rscript code/05_render_report.R

output/clean_data.rds: code/data.R deaths_and_causes_synthetic.csv
	Rscript code/data.R

output/table1.rds: code/01_make_table.R output/clean_data.rds
	Rscript code/01_make_table.R

output/table2.rds: code/02_make_table.R output/clean_data.rds
	Rscript code/02_make_table.R

output/graph1.png: code/03_make_graph.R output/clean_data.rds
	Rscript code/03_make_graph.R

output/graph2.png: code/04_make_graph.R output/clean_data.rds
	Rscript code/04_make_graph.R

clean:
	rm -f output/*.rds output/*.png report.html