ggplot(data, aes(x = TOTAL_FUNDING..in.CR., y =
PROFIT.AFTER.TAX..in.CR))+ geom_point(aes(color = SECTOR), alpha = 0.7,
size = 3) +
labs(title = "Funding vs Profit",
x = "Total Funding (in CR)",
y = "Profit After Tax (in CR)") +
theme_minimal()