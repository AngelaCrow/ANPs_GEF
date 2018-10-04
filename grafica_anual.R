

#library("ggplot2")
#library("psych")
#library("pastecs")

rm(list = ls())

#dir.create("E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR")

anp<-read.csv("E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/CADNR_anual.csv")
head(anp)

nombre<-as.vector(anp[1,11])
nombre

eco<-read.csv("E:/3.CONABIO-IBUNAM_CC/ecoregion/bases_sinanp/CADNR_eco_anual.csv")
head(eco)

#selecion columnas
anps<-cbind(anp[c("POINT_X")],anp[c("POINT_Y")],anp[c("bio01")],anp[c("bio08")],anp[c("bio09")],anp[c("bio12")],
            anp[c("bio16")],anp[c("bio17")],anp[c("ETPp")], anp[c("Periodo")])

ecos<-cbind(eco[c("POINT_X")],eco[c("POINT_Y")],eco[c("bio01")],eco[c("bio08")],eco[c("bio09")],eco[c("bio12")],
            eco[c("bio16")],eco[c("bio17")],eco[c("ETPp")], eco[c("Periodo")])

anp_b<-cbind.data.frame( Nombre=nombre,anps, Region="ANP")
eco_b<-cbind.data.frame( Nombre=nombre,ecos, Region="Ecorregión")

base<-rbind.data.frame(anp_b,eco_b)
names(base)

names(base) <- c("Reserva","x", "y","bio01","bio08","bio09","bio12", "bio16","bio17","ETPp","Periodo","Region" )
head(base)

base_anp<-na.omit(subset(base, Region=="ANP"))
head(base_anp)

#write.csv(base_anp,"E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/CADNR_anual_fin.csv")

#----------------------Graficas
#Bases temperatura
b1<-as.data.frame(base$bio01)
bio1<-as.data.frame(cbind(b1, Variable="Temperatura media anual"))
colnames(bio1)[1]<-"Temperatura"
head(bio1)

b8<-as.data.frame(base$bio08)
bio8<-as.data.frame(cbind(b8, Variable="Temperatura media trimestre más húmedo"))
colnames(bio8)[1]<-"Temperatura"
head(bio8)

b9<-as.data.frame(base$bio09)
bio9<-as.data.frame(cbind(b9, Variable="Temperatura media trimestre más seco"))
colnames(bio9)[1]<-"Temperatura"
head(bio9)

temp<-rbind.data.frame(bio1, bio8, bio9)
PC_temp<-cbind(base, temp)
head(PC_temp)

#------------------------datos
library(psych)

p1<-subset(PC_temp, Periodo=="1910-1949")
p1_anp<-subset(p1, Region=="ANP")
d1<-describe(p1_anp) 
d_1<-cbind.data.frame(ANP=nombre,Periodo="1910-1949", d1)

p2<-subset(PC_temp, Periodo=="1950-1979")
p2_anp<-subset(p2, Region=="ANP")
d2<-describe(p2_anp) 
d_2<-cbind.data.frame(ANP=nombre,Periodo="1950-1979", d2)

p3<-subset(PC_temp, Periodo=="1980-2009")
p3_anp<-subset(p3, Region=="ANP")
d3<-describe(p3_anp) 
d_3<-cbind.data.frame(ANP=nombre,Periodo="1980-2009", d3)


describe<-rbind.data.frame(d_1, d_2, d_3)

#write.csv(describe, "E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/stat_CADNR.csv")


#--------------------


#write.csv(PC_temp,"E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/CADNR_anual_temp_pas.csv")

#Bases Precpitación
b_12<-as.data.frame(base$bio12)
bio12<-as.data.frame(cbind(b_12, Variable="Precpitación anual"))
colnames(bio12)[1]<-"Precpitación"
head(bio12)

b_16<-as.data.frame(base$bio16)
bio16<-as.data.frame(cbind(b_16, Variable="Precpitación del trimestre más húmedo"))
colnames(bio16)[1]<-"Precpitación"
head(bio16)

b_17<-as.data.frame(base$bio17)
bio17<-as.data.frame(cbind(b_17, Variable="Precpitación del trimestre más seco"))
colnames(bio17)[1]<-"Precpitación"
head(bio17)

b_e<-as.data.frame(base$ETPp)
bioe<-as.data.frame(cbind(b_e, Variable="Evapotranspiración potencial"))
colnames(bioe)[1]<-"Evapotranspiración"
head(bioe)

prec<-rbind.data.frame(bio12, bio16, bio17)
PC_prec<-cbind(base, prec)
unique(PC_prec$Variable)

evo<-rbind.data.frame(bioe)
PC_evo<-cbind(base, evo)
unique(PC_evo$Variable)

#write.csv(PC_prec,"E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/CADNR_anual_prec_pas.csv")
#write.csv(PC_evo,"E:/3.CONABIO-IBUNAM_CC/bases/ANP/CADNR/CADNR_anual_evo_pas.csv")

#graficas anual
#jpeg('precipitacion_CADNR_anual.jpeg', res=300)
sp_p<-cbind(PC_prec[c("Periodo")],PC_prec[c("Precpitación")],PC_prec[c("Variable")],PC_prec[c("Region")])
head(sp_p)
unique(sp_p$Variable)


p <- ggplot(data = sp_p, aes(x=Periodo, y=Precpitación)) + 
  geom_boxplot(aes(fill=Periodo))
p + facet_grid( Region~ Variable)+scale_fill_manual(values = c("cadetblue2","cadetblue1", "cadetblue"))    + theme(legend.position="bottom") + labs( y = "Precpitación (mm)")
#dev.off()

#jpeg('evotranspiracion_CADNR_anual.jpeg', res=300)
sp_e<-cbind(PC_evo[c("Periodo")],PC_evo[c("Evapotranspiración")],PC_evo[c("Variable")],PC_evo[c("Region")])
head(sp_e)
unique(sp_e$Variable)

p <- ggplot(data = sp_e, aes(x=Periodo, y=Evapotranspiración)) + 
 geom_boxplot(aes(fill=Periodo))
p + facet_grid( Region~ Variable)+scale_fill_manual(values = c("purple3","turquoise3", "darkgoldenrod3"))    + theme(legend.position="bottom") + labs( y = "Evapotranspiración (mm/anual)")
#dev.off()

#graficas por temperatura
#tiff('temperatura_CADNR_anual.tiff', res=300)
sp_t<-cbind(PC_temp[c("Periodo")],PC_temp[c("Temperatura")],PC_temp[c("Variable")],PC_temp[c("Region")])
head(sp_t)
unique(sp_t$Periodo)

p <- ggplot(data = sp_t, aes(x=Periodo, y=Temperatura)) + 
  geom_boxplot(aes(fill=Periodo))
p + facet_grid( Region~ Variable)+scale_fill_manual(values = c("cadetblue1","tan1", "tan"))    + theme(legend.position="bottom")  + labs( y = "Temperatura (?C)")
#dev.off()
