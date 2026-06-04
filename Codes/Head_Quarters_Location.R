hq_count <- data %>%
count(HEAD_QUARTERS) %>%
arrange(desc(n)) %>%
top_n(15, n) # Show top 15 locations
ggplot(hq_count, aes(x = reorder(HEAD_QUARTERS, -n), y = n)) +
geom_bar(stat = "identity", fill = "steelblue") +
labs(title = "Top 15 Startup Headquarters Locations",
x = "Location",
y = "Count") +
theme(axis.text.x = element_text(angle = 45, hjust = 1))