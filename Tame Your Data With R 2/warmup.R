#warmup and iris dataset
library(tidyverse)

a <- 1


b <- 2

a + b

a > b

a < b

a == b

x <- a + b

x

y <- c(1, 2, 3, 4)

y

x + y

x * y

y + y

z <- c(10, 10, 10, 10)

y + z

i <- iris

sepLen <- iris %>% select(Sepal.Length)

noSepLen <- iris %>% subset(select = -c(Sepal.Length))

iris

noSepLen

maxSepLen <- sepLen %>% max()

iris %>% select(Sepal.Length) %>% max()
