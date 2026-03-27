here::i_am("code/data.R")

data <- read.csv("deaths_and_causes_synthetic.csv")

saveRDS(data, 
        file= here::here("output/clean_data.rds"))
