FROM rocker/tidyverse:4.5.1 as base 

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

### Part 2 ###
 
COPY Makefile . 
COPY DATA550final.Rmd . 

RUN mkdir code 
RUN mkdir output
RUN mkdir report

COPY output . 
COPY code code 
COPY deaths_and_causes_synthetic.csv .

CMD make && mv DATA550final.html report/
