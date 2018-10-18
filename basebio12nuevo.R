library(raster)
library(stringr)
anp_p<-read.csv("anps_fed_terrestres2018.csv")
names(anp_p)
coor <- anp_p[c("POINT_X", "POINT_Y")]

####CNRMCM5rcp85####
prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-paste("Valor")
anp2$Periodo="1950-1979"
anp2$MGC ="Historico"
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-paste("Valor")
anp3$Periodo="1980-2009"
anp3$MGC ="Historico"
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-paste("Valor")
anp4$Periodo="2015-2039"
anp4$MGC ="CNRMCM5_rcp85"
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-paste("Valor")
anp5$Periodo="2045-2069"
anp5$MGC ="CNRMCM5_rcp85"
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-paste("Valor")
anp6$Periodo="2075-2099"
anp6$MGC ="CNRMCM5_rcp85"

climaCNRMCM5_rcp85<-rbind(anp2,anp3,anp4,anp5,anp6)
rm(anp2,anp3,anp4,anp5,anp6,prec2,prec3,prec4,prec5,prec6)


####GFDL_CM3rcp85####
prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp85_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp85_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/GFDL_CM3_rcp85_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-paste("Valor")
anp2$Periodo="1950-1979"
anp2$MGC ="Historico"
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-paste("Valor")
anp3$Periodo="1980-2009"
anp3$MGC ="Historico"
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-paste("Valor")
anp4$Periodo="2015-2039"
anp4$MGC ="GFDL_CM3_rcp85"
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-paste("Valor")
anp5$Periodo="2045-2069"
anp5$MGC ="GFDL_CM3_rcp85"
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-paste("Valor")
anp6$Periodo="2075-2099"
anp6$MGC ="GFDL_CM3_rcp85"

climaGFDL_CM3_rcp85<-rbind(anp2,anp3,anp4,anp5,anp6)
rm(anp2,anp3,anp4,anp5,anp6, prec2,prec3,prec4,prec5,prec6)

##HADGEM2_ESrcp85####
prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp85_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp85_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/HADGEM2_ES_rcp85_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-paste("Valor")
anp2$Periodo="1950-1979"
anp2$MGC ="Historico"
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-paste("Valor")
anp3$Periodo="1980-2009"
anp3$MGC ="Historico"
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-paste("Valor")
anp4$Periodo="2015-2039"
anp4$MGC ="HADGEM2_ES_rcp85"
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-paste("Valor")
anp5$Periodo="2045-2069"
anp5$MGC ="HADGEM2_ES_rcp85"
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-paste("Valor")
anp6$Periodo="2075-2099"
anp6$MGC ="HADGEM2_ES_rcp85"

climaHADGEM2_ES_rcp85<-rbind(anp2,anp3,anp4,anp5,anp6)
rm(anp2,anp3,anp4,anp5,anp6, prec2,prec3,prec4,prec5,prec6)

##MPI_ESM_LRrcp85####
prec2 <-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g/p2bio12.tif")
prec3<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
prec4<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp85_2015-2039_bio/bio12nuevo.tif")
prec5<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp85_2045-2069_bio/bio12nuevo.tif")
prec6<-raster("E:/UniAtmos_P3/UniAtmosAngela/MPI_ESM_LR_rcp85_2075-2099_bio/bio12nuevo.tif")

anp2 <- as.data.frame(raster::extract(prec2, coor))
names(anp2)<-paste("Valor")
anp2$Periodo="1950-1979"
anp2$MGC ="Historico"
anp3 <- as.data.frame(raster::extract(prec3, coor))
names(anp3)<-paste("Valor")
anp3$Periodo="1980-2009"
anp3$MGC ="Historico"
anp4 <- as.data.frame(raster::extract(prec4, coor))
names(anp4)<-paste("Valor")
anp4$Periodo="2015-2039"
anp4$MGC ="MPI_ESM_LR_rcp85"
anp5 <- as.data.frame(raster::extract(prec5, coor))
names(anp5)<-paste("Valor")
anp5$Periodo="2045-2069"
anp5$MGC ="MPI_ESM_LR_rcp85"
anp6 <- as.data.frame(raster::extract(prec6, coor))
names(anp6)<-paste("Valor")
anp6$Periodo="2075-2099"
anp6$MGC ="MPI_ESM_LR_rcp85"

climaMPI_ESM_LR_rcp85<-rbind(anp2,anp3,anp4,anp5,anp6)

#bind####
clima<-rbind(climaCNRMCM5_rcp85,climaGFDL_CM3_rcp85,climaHADGEM2_ES_rcp85,climaMPI_ESM_LR_rcp85)
clima$Variable="Precipitacion"
base<-cbind(anp_p,clima)
rm(anp2,anp3,anp4,anp5,anp6, prec2,prec3,prec4,prec5,prec6, climaCNRMCM5_rcp85,climaGFDL_CM3_rcp85,climaHADGEM2_ES_rcp85,climaMPI_ESM_LR_rcp85)
names(base)
