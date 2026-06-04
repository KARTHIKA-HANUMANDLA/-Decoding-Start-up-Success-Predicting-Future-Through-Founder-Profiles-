stage_count <- data %>%
count(STAGE)
ggplot(stage_count, aes(x = "", y = n, fill = STAGE)) +
geom_bar(stat = "identity", width = 1) +
coord_polar("y", start = 0) +
labs(title = "Funding Stage Distribution") +
theme_void() +
theme(legend.position = "right")
