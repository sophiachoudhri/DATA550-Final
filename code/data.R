here::i_am("code/data.R")

df <- read.csv("deaths_and_causes_synthetic.csv")

saveRDS(df, 
        file= here::here("output/clean_data.rds"))
