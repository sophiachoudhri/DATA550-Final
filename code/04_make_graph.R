here::i_am("code/04_make_graph.R")

graph2 <- ggplot(data, aes(x = reorder(Cause_of_Death, Number_of_Deaths),
                 y = Number_of_Deaths)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Number of Deaths by Cause",
    x = "Cause of Death",
    y = "Number of Deaths"
  )

ggsave(graph2, 
       file= here::here("output/graph2.png"))