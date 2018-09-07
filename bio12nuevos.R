library(raster)
library(stringr)
anp_p<-read.csv("C:/CONABIO/Tendencias/anps_fed_terrestres2018.csv")
names(anp_p)
coor <- anp_p[c("POINT_X", "POINT_Y")]

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_prec/*p4prec*.tif"))
names(prec4)
prec4<-sum(prec4)
writeRaster(prec4, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_bio/bio12nuevo.tif")
plot(prec)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2079_prec/*p5prec*.tif"))
names(prec5)
prec5<-sum(prec5)
writeRaster(prec5, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2079_bio/bio12nuevo.tif")
plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_prec/*p6prec*.tif"))
names(prec6)
prec6<-sum(prec6)
writeRaster(prec6, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_bio/bio12nuevo.tif")
plot(prec)
rm(prec6)

##rcp45

prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-2
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-3
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-4
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-5
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-6

base<-cbind(anp2,anp3,anp4,anp5,anp6, anp_p)
write.csv(base,"baseCNRMCM5_rcp45.csv")

rm(anp2,anp3,anp4,anp5,anp6, prec2,prec3,prec4,prec5,prec6, prec)

##rcp85
prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_prec/*p4prec*.tif"))
names(prec4)
prec4<-sum(prec4)
writeRaster(prec4, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif")
plot(prec)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2045-2079_prec/*p5prec*.tif"))
names(prec5)
prec5<-sum(prec5)
writeRaster(prec5, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2045-2079_bio/bio12nuevo.tif")
plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2075-2099_prec/*p6prec*.tif"))
names(prec6)
prec6<-sum(prec6)
writeRaster(prec6, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2075-2099_bio/bio12nuevo.tif")
plot(prec)
rm(prec6)

prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-2
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-3
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-4
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-5
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-6

base<-cbind(anp2,anp3,anp4,anp5,anp6, anp_p)
write.csv(base,"baseCNRMCM5_rcp85.csv")
PC<-subset(base,NOMBRE=="Pantanos de Centla") 
PC<-PC[,1:5]
PC<-colMeans(PC, na.rm=T)
write.csv(PC, "pantanosdecentla.csv")
EV<-subset(base, str_detect(base$NOMBRE, "El Viz")) 
EV<-EV[,1:5]
EV<-colMeans(EV, na.rm=T)
write.csv(EV, "ElVizcaino.csv")
rm(anp2,anp3,anp4,anp5,anp6, prec2,prec3,prec4,prec5,prec6, prec)