
library(planex)
library(ggplot2)


baterias$tipo <- as.factor(baterias$tipo)
baterias$temperatura <- as.factor(baterias$temperatura)

g <- ggplot(baterias, aes(tipo, tempo))
g + geom_boxplot() + facet_wrap(. ~ temperatura)

# alternativamente:
g <- ggplot(baterias, aes(temperatura, tempo))
g + geom_boxplot() + facet_wrap(. ~ tipo)


baterias %>%
  group_by(tipo, temperatura) %>%
  summarise(media = mean(tempo)) -> baterias2


baterias2 %>%
  ggplot() +
    aes(x = temperatura, y = media, color = tipo) +
    geom_line(aes(group = tipo)) +
    geom_point()


# fazendo tudo de uma vez:
baterias %>%
  group_by(tipo, temperatura) %>%
  summarise(media = mean(tempo)) %>%
  ggplot() +
  aes(x = temperatura, y = media, color = tipo) +
  geom_line(aes(group = tipo)) +
  geom_point()

# alterando a variável no eixo x:
baterias %>%
  group_by(tipo, temperatura) %>%
  summarise(media = mean(tempo)) %>%
  ggplot() +
    aes(x = tipo, y = media, color = temperatura) +
    geom_line(aes(group = temperatura)) +
    geom_point()


g <- ggplot(baterias, aes(temperatura, tempo, colours=tipo))
g + geom_point()
g + geom_line()
g + geom_path()
