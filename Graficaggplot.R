#He realizado una gráfica con ggplot2 mostrando la diferencia entre las puntuaciones post y pre de cada participante
diferencia <- Fotos_Gabriel$SBISS_post - Fotos_Gabriel$SBISS_pre
library(ggplot2)
media_diferencias <- mean(diferencia, na.rm = TRUE)
sd_diferencias <- sd(diferencia, na.rm = TRUE)
ggplot(Fotos_Gabriel, aes(x = factor(ID), y = diferencia)) +
  +     geom_point(color = "blue", size = 3) +
  +     geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  +     geom_hline(yintercept = media_diferencias, color = "green", linetype = "solid", size = 1) +
  +     geom_hline(yintercept = media_diferencias + sd_diferencias, color = "purple", linetype = "dotted", size = 0.8) + # Media + SD
  +     geom_hline(yintercept = media_diferencias - sd_diferencias, color = "purple", linetype = "dotted", size = 0.8) + # Media - SD
  +     labs(
    +         title = "Diferencia entre puntuaciones pre y post por participante",
    +         x = "Participante",
    +         y = "Diferencia (post - pre)") +
  +     theme_minimal() +
  +     theme(
    +         axis.text.x = element_text(angle = 90, hjust = 1),
    +         panel.grid.major.x = element_blank())

#Puntos azules: Representan las diferencias por participante.
#Línea roja discontinua: Es la referencia en 0.
#Línea verde sólida: Indica la media de las diferencias.
#Líneas moradas punteadas: Representan una desviación estándar por encima y por debajo de la media.