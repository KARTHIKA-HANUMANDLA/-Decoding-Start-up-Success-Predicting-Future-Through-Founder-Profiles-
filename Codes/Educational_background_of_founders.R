x = "Educational Background",
y = "Count") +
theme(axis.text.x = element_text(angle = 45, hjust = 1)
edu_count <- data %>%
count(Educational_background) %>%
arrange(desc(n))
ggplot(edu_count, aes(x = reorder(Educational_background, -n), y = n)) +
geom_bar(stat = "identity", fill = "steelblue") +
labs(title = "Educational Background of Founders",
x = "Educational Background",
y = "Count") +theme(axis.text.x = element_text(angle = 45, hjust = 1))