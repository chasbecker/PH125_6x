# 2.1 Reshaping Data  this is a change on 06/08/2021

library(tidyverse)
library(dslabs)
data("gapminder")

rm(list=ls())
TidyData <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)

ap <- TidyData %>% ggplot(aes(year, fertility, color=country))+
  geom_point()
ap


path <- system.file("extdata", package="dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
WideData <- read_csv(filename)
select(WideData) # returns the type?

NewTidyData_1 <- WideData %>%
               gather( year, fertility, '1960':'2015')
head(NewTidyData_1)

NewTidyData_2 <- WideData %>%
  gather(year, fertility, -country)
head(NewTidyData_2)

class(TidyData$year)
class(NewTidyData_1$year)

NewTidyData_3 <- WideData %>%
                 gather(year, fertility, -country, convert=TRUE)
class(NewTidyData_3$year)


NewTidyData_3 %>% ggplot(aes(year, fertility, color=country))+
                   geom_point()

NewWideData <- NewTidyData_3 %>% spread(year, fertility)
select(NewWideData, country, '1960':'1967')


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library(tidyverse)
library(dslabs)

testing <- read.csv("testx.csv", check.names=FALSE)
View(testing)

testing_1 <- testing %>%
  gather(year, time, `2015`:`2017`)
View(testing_1)

testing <- read.csv("AgeYear.csv")
View(testing)
TestingWide <- testing %>% spread(year, time)
View(TestingWide)

co2
edit(co2)
class(co2)
co2_wide <- data.frame(matrix(co2, ncol=12, byrow=TRUE)) %>%
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_wide

co2_tidy <- gather(co2_wide, month, co2, -year)
head(co2_tidy)
co2_tidy

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color=year)) +
             geom_line()

# assessment Q12
library(tidyverse)
library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)
dat_tidy <- spread( dat, gender, admitted )
tmp <- gather(admissions, key, value, admitted:applicants)
tmp2 <- unite(tmp, column_name, c(key,gender))

