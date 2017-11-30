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
c <- cars
spd <- cars %>% select(speed)
noSpd <- cars %>% subset(select = -c(speed))
cars
noSpd
maxSpd <- spd %>% max()
cars %>% select(speed) %>% max()
