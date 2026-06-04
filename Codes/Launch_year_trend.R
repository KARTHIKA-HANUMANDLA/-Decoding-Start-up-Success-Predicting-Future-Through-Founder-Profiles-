launch_year_count <- data %>%
count(LAUNCH_YEAR) %>%
arrange(LAUNCH_YEAR)
ggplot(launch_year_count, aes(x = LAUNCH_YEAR, y = n)) +
geom_line(color = "steelblue", size = 1) +
geom_point(color = "steelblue") +
labs(title = "Startups Launched per Year",
x = "Launch Year",
y = "Number of Startups") +
scale_x_continuous(breaks = seq(min(launch_year_count$LAUNCH_YEAR),
max(launch_year_count$LAUNCH_YEAR), by = 2))