# -----------------------------------------------------------------
# -----------------------------------------------------------------
# Lib para leitura de dados
install.packages("tibble")
library(tibble)

as_tibble(mtcars)

tibble(
  coluna1 = c("a", "b", "c", "d"),
  coluna2 = 1:4,
  coluna3 = coluna2 ^ 2,
  coluna4 = 0
)

# -----------------------------------------------------------------
# -----------------------------------------------------------------

# Lib para engenharia de dados
install.packages("dplyr")
library("dplyr")

#cria uma nova coluna chamada "imc"
s2 <- mutate(starwars,
             imc = mass / ((height / 100) ^ 2),
             teste = ifelse(gender == 'male', 1, 2)
             )
View(s2)

# -----------------------------------------------------------------
# Filter
starwars %>%
  filter(species == "Droid") %>%
    View()

s3 = dplyr::filter(s2, imc < 20)

View(s3)

# -----------------------------------------------------------------
# Select (colunas) - Selecao de recursos

#Select padrao
starwars %>%
  select(name, ends_with("color")) %>% 
      View()

#Select com filter(WHERE)
starwars %>%
  select(name:mass, ends_with("color")) %>% 
    filter(eye_color == "blue") %>%
      View()

# -----------------------------------------------------------------
# Rename - renomear colunas

s2 = rename(starwars,
       nome = name,
       altura=height,
       massa = mass)

View(s2)

# -----------------------------------------------------------------
# Arrange - ORDER BY

starwars %>%
  arrange(desc(mass)) %>% 
    View()
  
# -----------------------------------------------------------------
# Agregacoes - GROUP BY

starwars %>%
  group_by(species) %>%
  summarise(
    # n() = COUNT
    j = n(),
    mass = mean(mass, na.rm = TRUE) %>% round(.,2)
  ) %>%
  filter(j > 1, species != 'Chagrian') %>% 
    View()

starwars %>%  dplyr::filter(species == 'Chagrian') %>%  View()






