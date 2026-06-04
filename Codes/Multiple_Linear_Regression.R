library(ggplot2)
library(dplyr)
data <- read_excel("~/Downloads/SM CBP (3).xlsx")
View(data)
attach(data)
lm_model <- lm(NPM~ Educational_background + SECTOR_NUMBERING+
HEAD_QUATERS_NUMBERING+LAUNCH_YEAR+STAGE_NUMBERING+ED
_NUMBERING+LOG_FUNDING+LOG_REVENUE+TOTAL_EXPENSES (in
CR)+TOTAL _ASSETS+TOTAL_ROUNDS,
data = data)
summary(lm_model)
Multiple:
lm_coef <- coef(lm_model)
print("Multiple Linear Regression Coefficients (npm):")
print(lm_coef)