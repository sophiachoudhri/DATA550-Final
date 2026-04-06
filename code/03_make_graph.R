here::i_am("code/03_make_graph.R")

library(readr)
library(here)
library(ggplot2)

graph1 <- ggplot(df, aes(x = reorder(Cause_of_Death, Number_of_Deaths),
                           y = Number_of_Deaths)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Number of Deaths by Cause",
    x = "Cause of Death",
    y = "Number of Deaths"
  )

ggsave(graph1, 
        file= here::here("output/graph1.png"))