rm(list = ls())

library("ggplot2")
library("plyr")
library("readr")

#loc <- locale(encoding="windows-1252")
#anp<-readr::read_csv("M_1NR/M_1NR_mes85.csv", locale=loc)
#anp<-readr::read_csv("M_1NR/M_1NR_mes85.csv")
anp<-M_1
unique(anp$Variable)
names(anp)

Reserva<-as.vector(anp[2,5]) #nombre del anp que esta en la columna 5 fila 2
Reserva

#selecion columnas
baseM_1<-cbind(anp[c("POINT_X")],anp[c("POINT_Y")], anp[c("Periodo")],anp[c("Variable")],anp[c("Valor")],anp[c("MGC")])

baseM_1<-cbind.data.frame(Reserva=Reserva,baseM_1)
head(baseM_1)

#----------------------Grafica
#funcion graficas estadisticas
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

#Estadisticas
ppt <- data_summary(baseM_1, varname="Valor", groupnames=c( "Periodo", "MGC"))
head(ppt)

#Precipitaci?n
ggplot(ppt, aes(x=Periodo, y=Valor, colour=MGC, group=Periodo, shape=MGC))+  
  geom_point(size = 3)+
  labs( y = "Precipitación (mm)")+
  scale_shape_manual(values=c(15,16,17,16,18))+
  scale_color_manual(values = c('#313695','#bf812d','#dfc27d','#1a1a1a','#b2182b'))
ggsave("M_1Ppt85.jpg", dpi = 300)
