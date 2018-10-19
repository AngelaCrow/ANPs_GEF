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
bio12_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_bio/bio12nuevo.tif")
bio12_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif")
#MPI_ESM_LR
#bio12_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp85_2015-2039_bio/bio12nuevo.tif")
#GFDL_CM3
#bio12_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp85_2015-2039_bio/bio12nuevo.tif")
#HADGEM2_ES
#bio12_45<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp45_2015-2039_bio/bio12nuevo.tif")
#bio12_85<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp85_2015-2039_bio/bio12nuevo.tif")


reg4.45<- as.data.frame(extract(bio12_45, coor))
names(reg4.45)[1]<-paste("Precipitacion_Total") 
reg4.45<-cbind(reg, reg4.45, Periodo="2015-2039", RCP="RCP 4.5")
regiones_45<-reg4.45[complete.cases(reg4.45),]

reg4.85<- as.data.frame(extract(bio12_85, coor))
names(reg4.85)[1]<-paste("Precipitacion_Total") 
reg4.85<-cbind(reg, reg4.85, Periodo="2015-2039", RCP="RCP 8.5")
regiones_85<-reg4.85[complete.cases(reg4.85),]

mesas<-rbind(regiones_45,regiones_85)
write.csv(mesas, "MesasTaller/Mesas-2015-2039_ppt_CNRMCM5.csv")
