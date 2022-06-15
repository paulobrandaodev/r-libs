library(readr)

getwd()
setwd('C:/Users/logonrmlocal/Downloads/r-libs')

imdb <- readr::read_rds('imdb.rds')

names(imdb)

# 1
filmes_ordenados =  imdb %>%
                    arrange(ano, desc(receita)) %>% 
                    View()

# 2
imdb %>% 
  select(titulo, orcamento) %>% 
    arrange(orcamento) %>% 
      View()

# 3
filmes_pb = imdb %>% filter(cor == 'Black and White')
View(filmes_pb)

# 4
curtos_legais = imdb %>% filter(duracao <= 90, nota_imdb > 8.5)
View(curtos_legais)

# 5
imdb_prejuizo = mutate(imdb, 
                       prejuizo = orcamento-receita) %>% 
                filter(prejuizo < 0) %>% 
                arrange(desc(prejuizo))
View(imdb_prejuizo)

# 6
mutate(imdb, 
       lucro = receita-orcamento,
       lucro_medio = mean(lucro, na.rm = TRUE),
       lucro_relativo = (lucro - lucro_medio)/lucro_medio,
       houve_lucro = ifelse(lucro > 0, "sim", "nao")
       ) %>% 
      select(-lucro) %>% 
  View()
    
        


