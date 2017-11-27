library(tidyverse)
super <- read_csv("superheroes.csv")
head(super)
tail(super)

summary(super)
table(super)

super %>% table()
super %>% select(age, sex) %>% table() 

super <- read_csv("superheroes.csv", na = c("","0","NA"))
super %>% head()
super %>% tail()

super %>% drop_na()
super %>% drop_na(alignment)
super %>% drop_na(age)
super %>% drop_na(alignment,age)
super <- super %>% drop_na(name)
super

super %>% select(age) %>% summary()
super %>% filter(sex == 'male') %>% select(age) %>% summary()
super %>% filter(sex == 'male') %>% filter(alignment == 'good') %>% select(age) %>% summary()

super <- super %>% replace_na(list(age = 29))
super
super %>% select(alignment) %>% table() %>% which.max() %>% names()
super %>% filter(sex == 'female') %>% select(alignment) %>% table() %>% which.max() %>% names()
super <- super %>% replace_na(list(alignment = super %>% filter(sex == 'female') %>% select(alignment) %>% table() %>% which.max() %>% names()))
super

second <- read_csv("characteristics.csv")
second %>% head()
second
secondWide <- second %>% spread(status, measurement)
secondWide
help("gather")
secondWide <- secondWide %>% arrange(flyingSpeedmph)
secondWide
secondWide <- secondWide %>% arrange(desc(flyingSpeedmph))
secondWide

inner_join(super, secondWide)
super %>% inner_join(secondWide)
super %>% semi_join(secondWide)
super %>% anti_join(secondWide)
super %>% full_join(secondWide)
result <- super %>% anti_join(secondWide)
result

result %>% ggplot(aes(sex)) +
  geom_bar(aes(fill=alignment)) 
result %>% ggplot(aes(x=name, y=age, label=age )) + 
  geom_point(stat='identity', fill="black", size=8) +
  geom_segment(aes(y = 0, 
                   x = name, 
                   yend = age, 
                   xend= name), 
               color = "black") +
  coord_flip()
result %>% filter(name != "Loki") %>% ggplot(aes(x=name, y=age, label=age )) + 
  geom_point(stat='identity', fill="black", size=8) +
  geom_segment(aes(y = 0, 
                   x = name, 
                   yend = age, 
                   xend= name), 
               color = "black") +
  coord_flip()
result %>% filter(name != "Loki") %>% ggplot(aes(x=name, y=age, label=age )) + 
  geom_point(stat='identity', fill="black", size=8) +
  geom_segment(aes(y = 32, 
                   x = name, 
                   yend = age, 
                   xend= name), 
               color = "black") +
  geom_text(color="white", size=3)+
  labs(title="Who's older and younger than the Batman?", subtitle="Batman is 32")+
  coord_flip()
