## Week 5- Exercise on data import using "readr" from different data formats

## Install packages and call library
  install.packages ("tidyverse")
  library ("tidyverse")

## Read CSV files from directory with different data arrangement types
  read_csv ("file path/filename.csv")   # reads comma delimited files
  read_csv2()   # reads semicolon separated files 
  read_tsv()    # reads tab delimited files 
  read_delim()  # reads in files with any delimiter

## Ingnorening/skipping certain specified lines from the csv file
  read_csv("file path/filename.csv", skip = n)    # skips first n rows in the file
  read_csv("file path/filename.csv", comment = "#")   # skips all rows that start with '#"
  read_csv("file path/filename.csv", col_names = FALSE)   # For the file does not have header 
  read_csv("file path/filename.csv", col_names = c("x", "y", "z",...))  # Adds columns names as "x", "y" "z" etc.
  read_csv("file path/filename.csv", na = ".")    #Specified "NA" to the missing values in the dataset

  
## Parsing a vector/ parse_*() functions
  str(parse_logical(c("TRUE", "FALSE", "NA")))   # Parse in logicals
  str(parse_integer(c("1", "2", "3")))    # Parse in integers
  str(parse_date(c("2010-01-01", "1979-10-14")))  #Parse in date format
  parse_integer(c("1", "231", ".", "456"), na = ".") # Parse in integer with "NA" for missing values, 
                                                    #If parsing fails, you’ll get a warning message 
  parse_double() # Strict numeric parser
  parse_number() # Flexible numeric parser
  parse_character() # seems so simple that it shouldn’t be necessary
  parse_factor()  #create factors, the data structure that R uses to represent categorical variables with fixed and known values.
  parse_datetime() # and parse_date(), and parse_time()  allow parse various date & time specifications

## Parse Numbers
  parse_double("1.23")  # For normal case where '.' is used for decimal point
  parse_double("1,23", locale = locale(decimal_mark = ","))   #if',' is used for decimal point
  parse_number() # It ignores non-numeric characters before and after the number
                  # for example parse_number("$100") spits [1] 100 and parse_number("It cost $123.45") spits [1] 123
  parse_number("$123,456,789")  # Used in United Stats which ignores group separater ',' between the numbers
                                #> The out put is [1] 1.23e+08
  parse_number("123.456.789", locale = locale(grouping_mark = "."))  # Used in many parts of Europe #> [1] 1.23e+08
  parse_number("123'456'789", locale = locale(grouping_mark = "'")) # Used in Switzerland #> [1] 1.23e+08
  
## Parse Strings
  charToRaw("Hadley") # ASCII encoding- The mapping from hexadecimal number to character
  #Output  > [1] 48 61 64 6c 65 79; Each hexadecimal number represents a byte of information: 48 is H, 61 is a, and so on.
  
## Factors
  fruit <- c("apple", "banana")
  parse_factor(c("apple", "banana", "bananana"), levels = fruit) # Represent categorical variables with known set of known values/levels

## Dates, date-times, and times
  parse_datetime("2012-08-15T0545") #Date time format 
      # Output [1] "2012-08-15 05:45:00 UTC"
      # If time is omitted, it will be set to midnight
  parse_date("2010-10-01")
  #> outout [1] "2010-10-01"

  library(hms)
  parse_time("01:10 am")
  #> output 01:10:00
  parse_time("20:10:01")
  #> output 20:10:01