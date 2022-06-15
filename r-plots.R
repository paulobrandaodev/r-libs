install.packages("ggplot2")
library(ggplot2)

#carregando a base
imdb <- readr::read_rds("imdb.rds")
#chamando o ggplot
ggplot(data = imdb)
#Com o pipe
imdb %>% ggplot()

#grafico de dispersao
ggplot(imdb) +
  geom_point(mapping = aes(x = orcamento, y = receita), color ='blue') +
  geom_abline(intercept = 0, slope = 1, color = "red")


#exemplo 2
imdb %>%
  mutate(lucro = receita - orcamento) %>%
  ggplot() +
  geom_point(aes(x = orcamento, y = receita, color =
                   lucro))


#exemplo 3
imdb %>%
  mutate(
    lucro = receita - orcamento,
    lucro = ifelse(lucro <= 0, "Não", "Sim")
  ) %>%
  filter(!is.na(lucro)) %>%
  ggplot() +
  geom_point(mapping = aes(x = orcamento, y =
                             receita, color = lucro))
