sector_count <- data %>%
count(SECTOR) %>%
arrange(desc(n))
ggplot(sector_count, aes(x = reorder(SECTOR, -n), y = n)) +
geom_bar(stat = "identity", fill = "steelblue") +
labs(title = "Sector-wise Startup Count",
x = "Sector",
y = "Number of Startups") +
theme(axis.text.x = element_text(angle = 45, hjust = 1))