library("raster")
library("rgdal")
library("sp")
library("rgeos")
library("maptools")
library("ggplot2")

regiones<-readOGR(dsn="C:/CONABIO/Taller Conectividad/Mapas/Regiones_gp.shp",layer="Regiones_gp")
projection(regiones) <- CRS("+proj=longlat")
names(regiones)
coor<-regiones[c("POINT_X","POINT_Y")]
reg<-data.frame(regiones[c("grid_code")])
reg<-data.frame(reg[,1])
names(reg)[1]<-paste("regiones")
#CNRMCM5
#bio12_4_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_4_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif")
#MPI_ESM_LR
bio12_4_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp45_2015-2039_bio/bio12nuevo.tif")
bio12_4_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp85_2015-2039_bio/bio12nuevo.tif")
#GFDL_CM3
#bio12_4_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_4_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp85_2015-2039_bio/bio12nuevo.tif")
#HADGEM2_ES
#bio12_4_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_4_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp85_2015-2039_bio/bio12nuevo.tif")


reg4.45<- as.data.frame(extract(bio12_4_45, coor))
names(reg4.45)[1]<-paste("Precipitacion_Total") 
reg4.45<-cbind(reg, reg4.45, Periodo="2045-2069", RCP="RCP 4.5")
regiones_fc45<-reg4.45[complete.cases(reg4.45),]

reg4.85<- as.data.frame(extract(bio12_4_85, coor))
names(reg4.85)[1]<-paste("Precipitacion_Total") 
reg4.85<-cbind(reg, reg4.85, Periodo="2045-2069", RCP="RCP 8.5")
regiones_fc85<-reg4.85[complete.cases(reg4.85),]

mesas<-rbind(regiones_fc45,regiones_fc85)
write.csv(mesas, "Mesas_ppt_MPI_ESM_LR.csv")

region1 <-subset(regiones_fc45, regiones == "1")
region2 <-subset(regiones_fc45, regiones == "2")
region3 <-subset(regiones_fc45, regiones == "3")

#plots
p<-ggplot(regiones_fc45, aes(x=Precipitacion_Total)) +
     geom_histogram(color="black", fill="white", bins = 40) +
     facet_grid(regiones ~ .)
p + scale_color_grey() +scale_fill_grey() 


p<-ggplot(mesas) +
  geom_histogram(aes(x=Precipitacion_Total, fill = RCP), bins = 40) +
  facet_grid(regiones ~ .) +
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  labs(title="MPI_ESM_LR",x="Precipitacion total (mm)", y = "Frecuencia")
p
ggsave("ppt-fc_MPI_ESM_LR_mesas.jpg", dpi = 300)
