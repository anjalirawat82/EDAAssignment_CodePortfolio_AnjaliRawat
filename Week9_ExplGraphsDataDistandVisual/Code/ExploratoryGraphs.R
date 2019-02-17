# Visualizing Distribution

library(tidyverse)

## ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut)) -  Distribution of continous one variable


## 7.3.4 Exercises

## Explore the distribution of each of the x, y, and z variables in diamonds. What do you learn? 


ggplot(data=diamonds)+geom_histogram(mapping=aes(x=x),binwidth = 0.5)

ggplot(data=diamonds)+geom_histogram(mapping=aes(x=y),binwidth = 0.5)

ggplot(data=diamonds)+geom_histogram(mapping=aes(x=z),binwidth = 0.5)

## All the distributions are skewed to right.All three distributions are bimodal. 



## Explore the distribution of price ?Do you discover anything unusual or surprising?

ggplot(filter(diamonds, price < 3000), aes(x = price)) +  geom_histogram(binwidth = 10, center = 0)


## Can't see diamond at price = $1500; Spike in the distribution around $750


## How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?

diamond1 = filter(diamonds,carat== 0.99)

length(diamond1$carat)

# 0.99 carat diamonds = 23

diamond2 = filter(diamonds, carat==1)

length(diamond2$carat)

## 1 carat diamonds = 1558

## Compare and contrast  coord_cartesian()  vs  xlim()  or  ylim()  when zooming in on a histogram. 

## The coord_cartesian() function zooms in on the area specified by the limits

##the xlim() and ylim() functions influence actions before the calculation of the stats related to the histogram. Thus, any values outside the x- and y-limits are dropped before calculating bin widths and counts


## Exercises 7.4.1 

## What happens to missing values in a histogram? What happens to missing values in a bar chart? Why is there a difference?


## In histogram missing values are removed when the number of observations in each bin are calculated.In barchart NA is treated as another category.


##What does  na.rm = TRUE  do in  mean()  and  sum() ?

## Removes NA values from the vector prior to calculating the mean and sum.


## Exploratory Graphs

## SimpleSummaries:OneDimension

## fivenum() - Five - number Summary - This give minimum, 25th percentile, median, 75th percentile and maximum of the data

library(tidyverse)

USEPA2017= read_csv("C:/Harrisburg University of Science and Technology/Anly 506-90- O-2018Late Fall - Exploratory Data Analytics/Final Project/New folder/Week9_ExplGraphsDataDistandVisual/Data/US EPA data 2017.csv")

ozone=subset(USEPA2017,ParameterName == "Ozone")

fivenum(ozone$`Arithmetic Mean`)



## boxplot() - Boxplot - standardized way of visually displaying the distribution of data based on a five number summary and also provides information about outliers

boxplot(ozone$`Arithmetic Mean`,col="blue")



## barplot() - Barplot - standardized way of visually displaying categorical data, with the number of entries for each category being proportional to the height of the bar

table(ozone$`County Name`) %>% barplot(col = "blue")



## hist()  - Histogram -  standardized way of visually displaying continous data, complete empirical distribution of the data, 

hist(ozone$`Arithmetic Mean`, col = "green")



## density()   -Density Plot -shows the smoothed distribution of the points along the numeric axis.

density(ozone$`Arithmetic Mean`)


plot(density(ozone$`Arithmetic Mean`))



## SimpleSummaries:TwoDimensions


## Mulitple Boxplots - Used for comparing the distributions of several groups of data



## Multiple Histograms - Effective for comparison to see change in shape of distribution of a variable across different categories



## plot() - Scatterplots - Allosw us to two variables within our data
 

plot(ozone$Latitude,ozone$`Arithmetic Mean`,xlab = "Latitude", ylab ="ozone")


        
