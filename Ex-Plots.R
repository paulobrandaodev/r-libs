getwd()
setwd('C:/Users/logonrmlocal/Downloads/Plots')

install.packages("RColorBrewer")
library(RColorBrewer)

install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)
        

# Ex 3
ggplot(data = mtcars)

mtcars %>% 
  ggplot() +
  geom_point(aes(x = mpg, y = qsec, color = qsec))

# Ex 4
imdb <- readr::read_rds("imdb.rds")
names(imdb)

imdb %>% 
  ggplot() +
  geom_point(aes(x = nota_imdb, y = orcamento, color = orcamento))

# Ex 5
imdb %>% 
  filter(!is.na(ator_1)) %>%
  group_by(ator_1) %>%
  summarise(j = n()) %>% 
  arrange(desc(j)) %>% 
  head(5) %>% 
  inner_join(imdb,., by='ator_1') %>% 
  mutate(lucro = receita - orcamento) %>% 
  ggplot() +
  geom_boxplot(aes(x = ator_1, y = lucro, color = lucro, fill = ator_1))
  
