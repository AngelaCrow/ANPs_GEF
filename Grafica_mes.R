rm(list = ls())

library("ggplot2")
library("plyr")
library("readr")

setwd("/Volumes/GoogleDrive/My Drive/ANP_CC/bases_mes")

loc <- locale(encoding="windows-1252")
anp<-readr::read_csv("Centla/centla_mes45.csv", locale=loc)

names(anp)
head(anp)

Reserva<-as.vector(anp[2,6]) #nombre del anp que esta en la columna 5 fila 2
Reserva

#selecion columnas
base<-cbind(anp[c("POINT_X")],anp[c("POINT_Y")],anp[c("Enero")],anp[c("Febrero")],anp[c("Marzo")],anp[c("Abril")],
            anp[c("Mayo")],anp[c("Junio")],anp[c("Julio")],anp[c("Agosto")],anp[c("Septiembre")],anp[c("Octubre")],
            anp[c("Noviembre")],anp[c("Diciembre")],anp[c("Periodo")],anp[c("Variable")],anp[c("MGC")])


base<-cbind.data.frame( Reserva=Reserva,base)

base<-cbind.data.frame(Reserva=Reserva,base)

head(base)

base<-na.omit(subset(base, MGC="CNRMCM5_rcp45"))
unique(base$Variable)

#write.csv(base_anp,"E:/3.CONABIO-IBUNAM_CC/bases/ANP/monarca/monarca_mes_pas.csv")

#----------------------Graficas

head(base)

var<-cbind(base[c("Reserva")],base[c("POINT_X")],base[c("POINT_Y")], base[c("Periodo")],base[c("Variable")],base[c("MGC")])

var<-cbind(base[c("NOMBRE")],base[c("POINT_X")],base[c("POINT_Y")], base[c("Periodo")],base[c("Variable")],base[c("MGC")])

head(var)

#Bases temperatura
e1<-as.data.frame(base$Enero)
e_1<-as.data.frame(cbind(e1, Mes="Ene", var))
colnames(e_1)[1]<-"Valor"
head(e_1)

f1<-as.data.frame(base$Febrero)
f_1<-as.data.frame(cbind(f1, Mes="Feb",var))
colnames(f_1)[1]<-"Valor"

m1<-as.data.frame(base$Marzo)
m_1<-as.data.frame(cbind(m1, Mes="Mar",var))
colnames(m_1)[1]<-"Valor"
head(m_1)

a1<-as.data.frame(base$Abril)
a_1<-as.data.frame(cbind(a1, Mes="Abr",var))
colnames(a_1)[1]<-"Valor"
head(a_1)

ma1<-as.data.frame(base$Mayo)
ma_1<-as.data.frame(cbind(ma1, Mes="May",var))
colnames(ma_1)[1]<-"Valor"
head(ma_1)

j1<-as.data.frame(base$Junio)
j_1<-as.data.frame(cbind(j1, Mes="Jun",var))
colnames(j_1)[1]<-"Valor"
head(j_1)

jj1<-as.data.frame(base$Julio)
jj_1<-as.data.frame(cbind(jj1, Mes="Jul",var))
colnames(jj_1)[1]<-"Valor"
head(jj_1)

ag1<-as.data.frame(base$Agosto)
ag_1<-as.data.frame(cbind(ag1, Mes="Ago",var))
colnames(ag_1)[1]<-"Valor"
head(ag_1)

s1<-as.data.frame(base$Septiembre)
s_1<-as.data.frame(cbind(s1, Mes="Sep",var))
colnames(s_1)[1]<-"Valor"
head(s_1)

o1<-as.data.frame(base$Octubre)
o_1<-as.data.frame(cbind(o1, Mes="Oct",var))
colnames(o_1)[1]<-"Valor"
head(o_1)

n1<-as.data.frame(base$Noviembre)
n_1<-as.data.frame(cbind(n1, Mes="Nov",var))
colnames(n_1)[1]<-"Valor"
head(n_1)

d1<-as.data.frame(base$Diciembre)
d_1<-as.data.frame(cbind(d1, Mes="Dic",var))
colnames(d_1)[1]<-"Valor"
head(d_1)

month<-rbind(e_1,f_1, m_1,a_1,ma_1,j_1,jj_1,ag_1,s_1,o_1,n_1,d_1)
rm(e_1,f_1, m_1,a_1,ma_1,j_1,jj_1,ag_1,s_1,o_1,n_1,d_1, e1,f1,m1,a1,ma1,j1,jj1,ag1,s1,o1,n1,d1)
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

#Temperatura m?xima
tmax<-subset(month, Variable=="Temperatura máxima")
head(tmax)

Tmax <- data_summary(tmax, varname="Valor", 
                    groupnames=c( "Periodo","Mes", "Variable", "MGC"))
write.csv(Tmax,"Tmaxrcp45.csv")

#Temperatura promedio
tpro<-subset(month, Variable=="Temperatura promedio")
head(tpro)

Tmean <- data_summary(tpro, varname="Valor", 
                     groupnames=c( "Periodo","Mes", "Variable", "MGC"))
rm(tpro)
write.csv(Tmean,"Tmeanrcp45.csv")

#Temperatura minima
tmin<-subset(month, Variable=="Temperatura mínima")
head(tmin)

Tmin <- data_summary(tmin, varname="Valor", 
                     groupnames=c( "Periodo","Mes", "Variable", "MGC"))
rm(tmin)
write.csv(Tmin, "Tminrcp45.csv")

#Precipitaci?n
prec<-subset(month, Variable=="Precipitación")
head(prec)
Prec <- data_summary(prec, varname="Valor", 
                     groupnames=c( "Periodo","Mes", "Variable", "MGC"))
rm(prec)
write.csv(Prec,"Precrcp45.csv")

#---------------------------------------------------------
#------------------------Grafica temperatura maxima


ggplot(Tmax, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura máxima (°C)") + theme(legend.position="bottom")+
  scale_color_manual(values = c('#fed976','#fdae6b','#fd8d3c','#f16913','#e31a1c','#800026'))

#------------------------Grafica temperatura promedio

ggplot(Tmean, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura promedio (°C)") + theme(legend.position="bottom")+
  scale_color_manual(values = c('#fed976','#fdae6b','#fd8d3c','#f16913','#e31a1c','#800026'))

#------------------------Grafica temperatura minima

ggplot(Tmin, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura máxima (°C)") + theme(legend.position="bottom")+
  scale_color_manual(values = c('#fee391','#fdae6b','#fd8d3c','#f16913','#d94801','#662506'))


#------------------------precipitacion

ggplot(Prec, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
     geom_point(size = 3)+facet_grid(MGC~Variable)+ 
     labs( y = "Precipitación (mm)") + theme(legend.position="bottom")+
     scale_color_manual(values = c('#a6bddb','#74a9cf','#3690c0','#0570b0','#023858'))

ggplot(Tmax, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura máxima (°C)") + theme(legend.position="bottom")+
  scale_shape_manual(values=c(16,17,15,18,12))+
  scale_color_manual(values = c('#fed976','#fdae6b','#fd8d3c','#f16913','#e31a1c','#800026'))
ggsave("Centla/Tmax45.jpg", dpi = 300)

#------------------------Grafica temperatura promedio
ggplot(Tmean, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura promedio (°C)") + theme(legend.position="bottom")+
  scale_shape_manual(values=c(16,17,15,18,12))+
  scale_color_manual(values = c('#fed976','#fdae6b','#fd8d3c','#f16913','#e31a1c','#800026'))
ggsave("Centla/Tmean45.jpg", dpi = 300)

#------------------------Grafica temperatura minima
ggplot(Tmin, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Temperatura máxima (°C)") + theme(legend.position="bottom")+
  scale_shape_manual(values=c(16,17,15,18,12))+
  scale_color_manual(values = c('#081d58','#225ea8','#41b6c4', "#74c476",'#f16913','#d94801'))
ggsave("Centla/Tmin45.jpg", dpi = 300)

#------------------------precipitacion
ggplot(Prec, aes(x=Mes, y=Valor, colour=Periodo, group=Periodo, shape = Periodo))+  
  geom_point(size = 3)+facet_grid(MGC~Variable)+ 
  labs( y = "Precipitación (mm)") + theme(legend.position="bottom")+
  scale_shape_manual(values=c(16,17,15,18,12))+
  scale_color_manual(values = c('#a6bddb','#74a9cf','#3690c0','#0570b0','#023858'))
ggsave("Centla/Ppt45.jpg", dpi = 300)

