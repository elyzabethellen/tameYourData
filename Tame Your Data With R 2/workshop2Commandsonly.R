#tame your data 2 commands only
library(tidyverse)

super <- read_csv('newSuperheroes.csv')

second <- read_csv('newCharacteristics.csv')

second %>% head()

second

help("inner_join")

inner_join(super, second)

superInner <- super %>% inner_join(second)

superInnerSpread <- superInner %>% spread(status, measurement, convert=TRUE)

superInnerSpread

help("gather")

superSemi <- super %>% semi_join(second)

superSemi

superFull <- super %>% full_join(second)

superFull

superFullSpread <- superFull %>% spread(status, measurement, convert=TRUE, fill="FILL ME!")

superFullSpread

superAnti <- super %>% anti_join(second)

superAnti

superAnti %>% ggplot(aes(sex)) +
geom_bar(aes(fill=alignment))
superAnti %>% ggplot(aes(x=name, y=age, label=age )) +
geom_point(stat='identity', fill="black", size=8) +
geom_segment(aes(y = 0,
x = name,
yend = age,
xend= name),
color = "black") +
coord_flip()

superAnti %>% filter(name != "Loki") %>% ggplot(aes(x=name, y=age, label=age )) +
geom_point(stat='identity', fill="black", size=8) +
geom_segment(aes(y = 0,
x = name,
yend = age,
xend= name),
color = "black") +
coord_flip()
