

## Data Manipulation

## filter() - Extract/Filter rows that meets logical criteria.


## Logical and Boolean Operators to use with filter() - < , > , <=, >=, !=, ==, isna(), !isna(), !, |, & , % in %


## Exercises - 5.2.4

library(nycflights13)

library(tidyverse)

library(dplyr)


## Find all Flights that had an arrival delay of two or more hours

flightarrdelayequalgreater2=filter(flights,arr_delay>=120)


## Find all Flights that Flew to Houston (IAH or HOU)

Houstonflights=filter(flights,dest=="IAH"|dest=="HOU")


## Find all Flights that Were operated by United, American, or Delta

filter(flights, carrier %in% c("AA", "DL", "UA"))


## Find all Flights that Departed in summer (July, August, and September)

filter(flights,month >=7,month <= 9)

filter(flights, month %in% 7:9)



## Find all Flights that Arrived more than two hours late, but didn't leave late

filter(flights, arr_delay > 120, dep_delay <= 0)



## Find all Flights that Were delayed by at least an hour, but made up over 30 minutes in flight

filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)



## Find all Flights that Departed between midnight and 6am (inclusive)

filter(flights, dep_time <= 600 | dep_time == 2400)



## arrange() - Order rows by values of column (low to high), use with desc() to order from high to low



## Exercises - 5.3.1 


## How could you use arrange() to sort all missing values to the start?


arrange(flights, desc(is.na(dep_time)), dep_time)


## Sort flights to find the most delayed flights. Find the flights that left earliest.


arrange(flights, desc(dep_delay))

arrange(flights, dep_delay)


## The most delayed flight was HA 51, JFK to HNL


## Flight that left earliest, Flight B6 97 (JFK to DEN)



## Sort flights to find the fastest flights.

arrange(flights, air_time)


## Which flights travelled the longest? Which travelled the shortest?

arrange(flights, desc(distance))

arrange(flights, distance)


## The longest flight is HA 51, JFK to HNL

## The shortest flight is US 1632, EWR to LGA



## select() - Extract columns by name



## Exercises 5.4.1 

## Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights

## Column names as Strings

select(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")

##columns names as variable names without quotes

select(flights, dep_time, dep_delay, arr_time, arr_delay)

## column numbers of the variables.

select(flights, 4, 6, 7, 9)

## What happens if you include the name of a variable multiple times in a select() call?

## select() ignores duplication. Duplicated variables are only included once, in the first location they appear.

select(flights, year, month, day, year)

## What does the one_of() function do? Why might it be helpful in conjunction with this vector?

## one_of() function selects variables with a character vector

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))

## Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
select(flights, contains("TIME"))

## The default behavior for contains() is to ignore case. select helpers deal with case by default by using ignore.case = FALSE

select(flights, contains("TIME", ignore.case = FALSE))


## helper functionsto use within select() are starts_with(match), ends_with(match),contains(match),matches(match),num_range(prefix,range)


## mutate() - Create new variables/columns with functions of existing variables

## 5.5.2 - Exercise

## Currently dep_time and sched_dep_time are convenient to look at, but hard to compute with because they're not really continuous numbers. Convert them to a more convenient representation of number of minutes since midnight.

flightstimes <- mutate(flights,dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,sched_dep_time_mins = (sched_dep_time %/% 100 * 60 + sched_dep_time %% 100) %% 1440)

## View columns that are relevant for times

select(flightstimes,dep_time,dep_time_mins,sched_dep_time,sched_dep_time_mins) 



## Find the 10 most delayed flights using a ranking function. How do you want to handle ties? Carefully read the documentation for min_rank().

flightsdelayed <- mutate(flights, dep_delay_rank = min_rank(-dep_delay))

flightsdelayed <- filter(flightsdelayed, dep_delay_rank <= 20)

arrange(flightsdelayed, dep_delay_rank)

## What does 1:3 + 1:10 return? Why?

1:3 + 1:10

# # Warning message:In 1:3 + 1:10 : longer object length is not a multiple of shorter object length
##[1]  2  4  6  5  7  9  8 10 12 11


## What trigonometric functions does R provide?

## cospi(x), sinpi(x), tanpi(x), cos(pi*x), tn(pi*x), tan(pi*x)






