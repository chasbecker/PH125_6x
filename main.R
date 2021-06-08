# USA - - - Covid-19 - - - VaccineRates - - - Outcomes
# data from https://www.nytimes.com/interactive/2021/us/covid-cases.html (accessed 04/14/2021)
# "FullyVac" is the independent variable
# "CasesPer100K" and "DailyDeathPer100K" are dependent variables

library(tidyverse)
rm(list=ls())

effects_data <- read.csv("NYTVaccineEffects.csv", header=TRUE)
effects_df <- data.frame(effects_data)
str(effects_df)

cases_lm <- lm( CasesPer100K ~ FullyVac, data=effects_df )
summary( cases_lm )
plot( effects_df$FullyVac, effects_df$CasesPer100K )
abline( cases_lm$coefficients )  # sloping the "wrong" way!

deaths_lm <- lm( DailyDeathPer100K ~ FullyVac, data = effects_df )
summary( deaths_lm )
plot( effects_df$FullyVac, effects_df$DailyDeathPer100K )
abline( deaths_lm$coefficients )  # minuscule effect
