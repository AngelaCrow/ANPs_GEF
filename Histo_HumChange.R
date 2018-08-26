

#ANP
anp<-readOGR(dsn="E:/3.CONABIO-IBUNAM_CC/anps_2017_todas/anp_xy.shp",layer="anp_xy")
#plot(anp)
projection(anp) <- CRS("+proj=longlat")
names(anp)
coor<-anp_p[c(4:5)]
head(coor)


Hum.change.fl<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_AET_ETP/Hum_change.tif")
plot(Hum.change)
Hum.change.fm<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_AET_ETP/Hum_change.tif")
plot(Hum.change)
z<-freq(Hum.change)
plot(z)

setwd("/Volumes/GoogleDrive/Mi unidad/ANP_CC")
library("raster")
library("rgdal")
library("sp")
library("rgeos")
library("maptools")

#ANP
#anp<-readOGR(dsn="anp_xy.shp",layer="anp_xy")
anps_todas<-read.csv("anps_fed_terrestres2018.csv")
#plot(anp)
#projection(anp) <- CRS("+proj=longlat")
names(anps_todas)
coor<-anps_todas[c("POINT_X"  ,  "POINT_Y")]
head(coor)


Hum.change.fc<-raster("CNRMCM5_rcp45_2015-2039_AET_ETP/Hum_change.tif")
plot(Hum.change.fc)
anpvar4<- as.data.frame(extract(Hum.change.fc, coor))
anp_var4<-cbind(anps_todas, anpvar4, Periodo="2015-2039")
names(anp_var4)[20]<-paste("Humidity_change") 

Hum.change.fm<-raster("CNRMCM5_rcp45_2045-2069_AET_ETP/Hum_change.tif")
plot(Hum.change.fm)
anpvar5<- as.data.frame(extract(Hum.change.fm, coor))
anp_var5<-cbind(anps_todas, anpvar5, Periodo="2045-2069")
names(anp_var5)[20]<-paste("Humidity_change") 

Hum.change.fl<-raster("CNRMCM5_rcp45_2075-2099_AET_ETP/Hum_change.tif")
#plot(Hum.change.fl)
anpvar6<- as.data.frame(extract(Hum.change.fl, coor))
anp_var6<-cbind(anps_todas, anpvar6, Periodo="2075-2099")
names(anp_var6)[20]<-paste("Humidity_change") 

anp_hum<-rbind(anp_var4,anp_var5,anp_var6)
write.csv(anp_hum,"anps_hum.csv")
head(anp_hum)

#par(mfrow=c(1,2))
#zfc<-hist(Hum.change.fc, main = "Cambio en humedad (2015-2039 rcp 4.5)")
#zfm<-hist(Hum.change.fm, main = "Cambio en humedad (2045-2069 rcp 4.5)")

hc <-read.csv("bases/Terminoshumedad45.csv")
hc.fc <-subset(hc, Periodo == "2015-2039")
hc.fm <-subset(hc, Periodo == "2045-2069")
hc.fl <-subset(hc, Periodo == "2075-2099")

hist(hc.fc$Humidity_change,breaks=15,col=rgb(1,1,0,0.7),xlab="number")
hist(hc.fm$Humidity_change,breaks=15,col=rgb(1,1,0,0.7),xlab="number")
par(new=TRUE)
hist(hc.fl$Humidity_change,breaks=15,col=rgb(0,1,1,0.5),xlab="number")

library(ggplot2)

ggplot(hc) +
   geom_histogram(aes(x=Humidity_change, fill=Periodo), bins = 40, 
   colour="grey50", alpha=0.5, position="identity")

hc<-dplyr::filter(hc, Periodo == "2015-2039")


hist(Hum.change.fc,xlim=c(-1.0, 0.3), ylim=c(0,16000),breaks=15,col=rgb(1,1,0,0.7),main="Cambio en humedad (2015-2039 rcp 4.5)",xlab="number")
par(new=TRUE)
hist(Hum.change.fm,xlim=c(-1.0, 0.3),ylim=c(0,16000),breaks=5,col=rgb(0,1,1,0.4),main="Cambio en humedad (2045-2069 rcp 4.5)",xlab="",ylab="")

