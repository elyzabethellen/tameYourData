#' ---
#' title: "Tame Your Data With R: Workshop 1"
#' author: "Elizabeth E. Esterly"
#' date: "October 23rd, 2017"
#' ---
#'  datasets adapted from Jenny Bryan, University of British Colombia, RStudio and Tidyverse https://github.com/jennybc
#'
#' *PART 1: WHAT DO WE HAVE HERE?*
#load the tidyverse set of functions
suppressMessages(library(tidyverse))
#load dataset 1 superheroes as just a view to look at it before assigning it to a variable
View(read_csv("~/Desktop/superheroes.csv"))
#look at different ways to deal with missing values
dataset <- read_csv("~/Desktop/superheroes.csv", na = c("","NA")) 
#we can add 0 to our list of expressions to fill with NA
dataset <- read_csv("~/Desktop/superheroes.csv", na = c("","0","NA"))
#get a summary of the data: notice that some values are character and some are numeric
summary(dataset)

## *PART 2: MAKE IT TIDY* : Filling missing character and numeric values
#Black Widow is missing an alignment (binary: good/evil). Fill value with:
#Most common alignment? (Column max)
commonAlign <- names(which.max(table(select(dataset, alignment))))

#most common Marvel alignment? (Filter column by row value, then take the max)
marvelVals <- filter(dataset, publisher == "Marvel")
marvelAlign <- names(which.max(table(select(marvelVals, alignment))))

#This is getting a little crazy! How about we try it the Tidyverse way:
#From the beginning, do most common alignment again:
commonAlign <- dataset %>% select(alignment) %>% table() %>% which.max() %>% names()

#From the beginning, do most common Marvel alignment again:
#Filter the column to just include Marvel entries > give that to the select function to grab alignment > 
#now make a table from (Marvel and alignment) > get the index of the max > and the name of the max
# much more natural workflow
marvelAlign <- filter(dataset, publisher == "Marvel") %>% select(alignment) %>% table() %>% which.max() %>% names()

#Now try most common female alignment. Use the same Tidyverse strategy as for Marvel alignment. 
femaleAlign <- filter(dataset, gender == "female") %>% select(alignment) %>% table() %>% which.max() %>% names()

#How about we just choose one at random...
chooseAlign <- c(commonAlign, marvelAlign, femaleAlign)
#Get one randomly sampled integer in the range (1, length of the list)
choice <- sample(1:length(chooseAlign), 1)
value <- chooseAlign[choice]

#we don't know who that is, delete that row
dataset <- na.omit(dataset)

## *PART 3: ALL TOGETHER, NOW
#' load dataset 2 publishers as just a view to look at it
View(read_csv("~/Desktop/publishers.csv"))

#' http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/






