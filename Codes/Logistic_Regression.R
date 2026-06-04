library(readxl)
library(dplyr)
library(ggplot2)
data <- read_excel("~/Downloads/SM CBP (3).xlsx", sheet = "Sheet1")
cols_to_numeric <- c("SECTOR_NUMBERING",
"HEAD_QUATERS_NUMBERING", "STAGE_NUMBERING",
"LOG_FUNDING", "LOG_REVENUE", "TOTAL_ROUNDS", "NPM")
data[cols_to_numeric] <- lapply(data[cols_to_numeric], function(x)
as.numeric(as.character(x)))
data <- data %>% filter(complete.cases(select(., all_of(cols_to_numeric))))
model <- glm(NPM ~ SECTOR_NUMBERING +
HEAD_QUATERS_NUMBERING + STAGE_NUMBERING +
LOG_FUNDING + LOG_REVENUE + TOTAL_ROUNDS,
data = data, family = binomial)
data <- data %>%
mutate(
predicted_prob = predict(model, type = "response"),
predicted_class = ifelse(predicted_prob > 0.3, 1, 0)
)
table(Predicted = data$predicted_class, Actual = data$NPM)
sorted_data <- data %>%
arrange(predicted_prob) %>%
mutate(rank = row_number())
ggplot(data = sorted_data, aes(x = rank, y = predicted_prob)) +
geom_point(aes(color = factor(NPM)), shape = 4, stroke = 1.5) +
labs(
x = "Index (Sorted by Predicted Probability)",
y = "Predicted Probability of NPM = 1",
color = "Actual NPM",
title = "S-Curve: Logistic Regression Predictions"
) +
theme_minimal()