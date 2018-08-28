library("raster")
library("rgdal")
library("readr")

setwd("E:/UniAtmos_P3/Tendencias")
loc <- locale(encoding="windows-1252")

anp_p<-read.csv("C:/CONABIO/Tendencias/anps_fed_terrestres2018.csv")

anp_p<-readr::read_csv("anps_fed_terrestres2018.csv", locale=loc)

names(anp_p)

coor <- anp_p[c("POINT_X", "POINT_Y")]

#TMAXIMA####
#CNRMCM5
tmax2 <-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaCNRMCM5_rcp45/*p2tmax*.tif"))
anp_tmax2 <- as.data.frame(raster::extract(tmax2, coor))
names(anp_tmax2)
colnames(anp_tmax2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                                     "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
#plot(tmax2)
rm(tmax2)

tmax3<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaCNRMCM5_rcp45/*p3tmax*.tif"))
anp_tmax3 <- as.data.frame(raster::extract(tmax3, coor))
names(anp_tmax3)
colnames(anp_tmax3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                                     "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
#plot(tmax3)
rm(tmax3)

anp_tmax.2<-cbind(anp_p,anp_tmax2, Periodo="1950-1979", Variable="Temperatura máxima", MGC ="CNRMCM5_rcp45")
anp_tmax.3<-cbind(anp_p,anp_tmax3, Periodo="1980-2009", Variable="Temperatura máxima", MGC ="CNRMCM5_rcp45")

tmax_historico<-rbind(anp_tmax.2,anp_tmax.3)
names(tmax_historico)

tmax4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaCNRMCM5_rcp45/*p4tmax*.tif"))
anp_tmax4 <- as.data.frame(raster::extract(tmax4, coor))
names(anp_tmax4)
colnames(anp_tmax4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax4<-cbind(anp_p,anp_tmax4, Periodo="2015-2039", Variable="Temperatura máxima", MGC ="CNRMCM5_rcp45")
#plot(tmax4)
rm(tmax4)

tmax5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaCNRMCM5_rcp45/*p5tmax*.tif"))
anp_tmax5 <- as.data.frame(raster::extract(tmax5, coor))
names(anp_tmax5)
colnames(anp_tmax5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax5<-cbind(anp_p,anp_tmax5, Periodo="2045-2069", Variable="Temperatura máxima", MGC ="CNRMCM5_rcp45")
#plot(tmax5)
rm(tmax5)

tmax6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaCNRMCM5_rcp45/*p6tmax*.tif"))
anp_tmax6 <- as.data.frame(raster::extract(tmax6, coor))
names(anp_tmax6)
colnames(anp_tmax6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax6<-cbind(anp_p,anp_tmax6, Periodo="2075-2099", Variable="Temperatura máxima", MGC ="CNRMCM5_rcp45")
#plot(tmax6)
rm(tmax6)

tmax_CNRMCM5_rcp45<-rbind(tmax_historico,anp_tmax4,anp_tmax5,anp_tmax6)
names(tmax_CNRMCM5_rcp45)
rm(anp_tmax4, anp_tmax5, anp_tmax6)

#GFDL_CM3
anp_tmax.2<-cbind(anp_p,anp_tmax2, Periodo="1950-1979", Variable="Temperatura máxima", MGC ="GFDL_CM3_rcp45")
anp_tmax.3<-cbind(anp_p,anp_tmax3, Periodo="1980-2009", Variable="Temperatura máxima", MGC ="GFDL_CM3_rcp45")

tmax_historico<-rbind(anp_tmax.2,anp_tmax.3)
names(tmax_historico)

tmax4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaGFDL_CM3_rcp45/*p4tmax*.tif"))
anp_tmax4 <- as.data.frame(raster::extract(tmax4, coor))
names(anp_tmax4)
colnames(anp_tmax4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax4<-cbind(anp_p,anp_tmax4, Periodo="2015-2039", Variable="Temperatura máxima", MGC ="GFDL_CM3_rcp45")
#plot(tmax4)
rm(tmax4)

tmax5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaGFDL_CM3_rcp45/*p5tmax*.tif"))
anp_tmax5 <- as.data.frame(raster::extract(tmax5, coor))
names(anp_tmax5)
colnames(anp_tmax5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax5<-cbind(anp_p,anp_tmax5, Periodo="2045-2069", Variable="Temperatura máxima", MGC ="GFDL_CM3_rcp45")
#plot(tmax5)
rm(tmax5)

tmax6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaGFDL_CM3_rcp45/*p6tmax*.tif"))
anp_tmax6 <- as.data.frame(raster::extract(tmax6, coor))
names(anp_tmax6)
colnames(anp_tmax6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax6<-cbind(anp_p,anp_tmax6, Periodo="2075-2099", Variable="Temperatura máxima", MGC ="GFDL_CM3_rcp45")
#plot(tmax6)
rm(tmax6)

tmax_GFDL_CM3_rcp45<-rbind(tmax_historico,anp_tmax4,anp_tmax5,anp_tmax6)
names(tmax_GFDL_CM3_rcp45)
rm(anp_tmax4, anp_tmax5, anp_tmax6)
#HADGEM2_ES
anp_tmax.2<-cbind(anp_p,anp_tmax2, Periodo="1950-1979", Variable="Temperatura máxima", MGC ="HADGEM2_ES_rcp45")
anp_tmax.3<-cbind(anp_p,anp_tmax3, Periodo="1980-2009", Variable="Temperatura máxima", MGC ="HADGEM2_ES_rcp45")

tmax_historico<-rbind(anp_tmax.2,anp_tmax.3)
names(tmax_historico)

tmax4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaHADGEM2_ES_rcp45/*p4tmax*.tif"))
anp_tmax4 <- as.data.frame(raster::extract(tmax4, coor))
names(anp_tmax4)
colnames(anp_tmax4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax4<-cbind(anp_p,anp_tmax4, Periodo="2015-2039", Variable="Temperatura máxima", MGC ="HADGEM2_ES_rcp45")
#plot(tmax4)
rm(tmax4)

tmax5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaHADGEM2_ES_rcp45/*p5tmax*.tif"))
anp_tmax5 <- as.data.frame(raster::extract(tmax5, coor))
names(anp_tmax5)
colnames(anp_tmax5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax5<-cbind(anp_p,anp_tmax5, Periodo="2045-2069", Variable="Temperatura máxima", MGC ="HADGEM2_ES_rcp45")
#plot(tmax5)
rm(tmax5)

tmax6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaHADGEM2_ES_rcp45/*p6tmax*.tif"))
anp_tmax6 <- as.data.frame(raster::extract(tmax6, coor))
names(anp_tmax6)
colnames(anp_tmax6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax6<-cbind(anp_p,anp_tmax6, Periodo="2075-2099", Variable="Temperatura máxima", MGC ="HADGEM2_ES_rcp45")
#plot(tmax6)
rm(tmax6)

tmax_HADGEM2_ES_rcp45<-rbind(tmax_historico,anp_tmax4,anp_tmax5,anp_tmax6)
names(tmax_HADGEM2_ES_rcp45)
rm(anp_tmax4, anp_tmax5, anp_tmax6)

#MPI_ESM_LR
anp_tmax.2<-cbind(anp_p,anp_tmax2, Periodo="1950-1979", Variable="Temperatura máxima", MGC ="MPI_ESM_LR_rcp45")
anp_tmax.3<-cbind(anp_p,anp_tmax3, Periodo="1980-2009", Variable="Temperatura máxima", MGC ="MPI_ESM_LR_rcp45")

tmax_historico<-rbind(anp_tmax.2,anp_tmax.3)
names(tmax_historico)

tmax4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaMPI_ESM_LR_rcp45/*p4tmax*.tif"))
anp_tmax4 <- as.data.frame(raster::extract(tmax4, coor))
names(anp_tmax4)
colnames(anp_tmax4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax4<-cbind(anp_p,anp_tmax4, Periodo="2015-2039", Variable="Temperatura máxima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmax4)
rm(tmax4)

tmax5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaMPI_ESM_LR_rcp45/*p5tmax*.tif"))
anp_tmax5 <- as.data.frame(raster::extract(tmax5, coor))
names(anp_tmax5)
colnames(anp_tmax5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax5<-cbind(anp_p,anp_tmax5, Periodo="2045-2069", Variable="Temperatura máxima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmax5)
rm(tmax5)

tmax6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMaximaMPI_ESM_LR_rcp45/*p6tmax*.tif"))
anp_tmax6 <- as.data.frame(raster::extract(tmax6, coor))
names(anp_tmax6)
colnames(anp_tmax6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmax6<-cbind(anp_p,anp_tmax6, Periodo="2075-2099", Variable="Temperatura máxima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmax6)
rm(tmax6)

tmax_MPI_ESM_LR_rcp45<-rbind(tmax_historico,anp_tmax4,anp_tmax5,anp_tmax6)
names(tmax_MPI_ESM_LR_rcp45)

basesotatmx<-rbind(tmax_GFDL_CM3_rcp45,tmax_CNRMCM5_rcp45,tmax_HADGEM2_ES_rcp45,tmax_MPI_ESM_LR_rcp45)
rm(anp_tmax2,anp_tmax.2,anp_tmax3,anp_tmax.3,anp_tmax4, 
   anp_tmax5, anp_tmax6,tmax_historico,tmax_GFDL_CM3_rcp45,tmax_CNRMCM5_rcp45,tmax_HADGEM2_ES_rcp45,tmax_MPI_ESM_LR_rcp45)

#TMINIMA####
#CNRMCM5
tmin2 <-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaCNRMCM5_rcp45/*p2tmin*.tif"))
anp_tmin2 <- as.data.frame(raster::extract(tmin2, coor))
names(anp_tmin2)
colnames(anp_tmin2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

#plot(tmin2)
rm(tmin2)

tmin3<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaCNRMCM5_rcp45/*p3tmin*.tif"))
anp_tmin3 <- as.data.frame(raster::extract(tmin3, coor))
names(anp_tmin3)
colnames(anp_tmin3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

anp_tmin.2<-cbind(anp_p,anp_tmin2, Periodo="1950-1979", Variable="Temperatura mínima", MGC ="CNRMCM5_rcp45")
anp_tmin.3<-cbind(anp_p,anp_tmin3, Periodo="1980-2009", Variable="Temperatura mínima", MGC ="CNRMCM5_rcp45")
tmin_historico<-rbind(anp_tmin.2,anp_tmin.3)
names(tmin_historico)

#plot(tmin3)
rm(tmin3)

tmin4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaCNRMCM5_rcp45/*p4tmin*.tif"))
anp_tmin4 <- as.data.frame(raster::extract(tmin4, coor))
names(anp_tmin4)
colnames(anp_tmin4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin4<-cbind(anp_p,anp_tmin4, Periodo="2015-2039", Variable="Temperatura mínima", MGC ="CNRMCM5_rcp45")
#plot(tmin4)
rm(tmin4)

tmin5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaCNRMCM5_rcp45/*p5tmin*.tif"))
anp_tmin5 <- as.data.frame(raster::extract(tmin5, coor))
names(anp_tmin5)
colnames(anp_tmin5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin5<-cbind(anp_p,anp_tmin5, Periodo="2045-2069", Variable="Temperatura mínima", MGC ="CNRMCM5_rcp45")
#plot(tmin5)
rm(tmin5)

tmin6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaCNRMCM5_rcp45/*p6tmin*.tif"))
anp_tmin6 <- as.data.frame(raster::extract(tmin6, coor))
names(anp_tmin6)
colnames(anp_tmin6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin6<-cbind(anp_p,anp_tmin6, Periodo="2075-2099", Variable="Temperatura mínima", MGC ="CNRMCM5_rcp45")
#plot(tmin6)
rm(tmin6)

tmin_CNRMCM5_rcp45<-rbind(tmin_historico,anp_tmin4,anp_tmin5,anp_tmin6)
names(tmin_CNRMCM5_rcp45)
rm(tmin_historico,anp_tmin4, anp_tmin5, anp_tmin6)

#GFDL_CM3
anp_tmin.2<-cbind(anp_p,anp_tmin2, Periodo="1950-1979", Variable="Temperatura mínima", MGC ="GFDL_CM3_rcp45")
anp_tmin.3<-cbind(anp_p,anp_tmin3, Periodo="1980-2009", Variable="Temperatura mínima", MGC ="GFDL_CM3_rcp45")
tmin_historico<-rbind(anp_tmin.2,anp_tmin.3)
names(tmin_historico)

tmin4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaGFDL_CM3_rcp45/*p4tmin*.tif"))
anp_tmin4 <- as.data.frame(raster::extract(tmin4, coor))
names(anp_tmin4)
colnames(anp_tmin4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin4<-cbind(anp_p,anp_tmin4, Periodo="2015-2039", Variable="Temperatura mínima", MGC ="GFDL_CM3_rcp45")
#plot(tmin4)
rm(tmin4)

tmin5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaGFDL_CM3_rcp45/*p5tmin*.tif"))
anp_tmin5 <- as.data.frame(raster::extract(tmin5, coor))
names(anp_tmin5)
colnames(anp_tmin5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin5<-cbind(anp_p,anp_tmin5, Periodo="2045-2069", Variable="Temperatura mínima", MGC ="GFDL_CM3_rcp45")
#plot(tmin5)
rm(tmin5)

tmin6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaGFDL_CM3_rcp45/*p6tmin*.tif"))
anp_tmin6 <- as.data.frame(raster::extract(tmin6, coor))
names(anp_tmin6)
colnames(anp_tmin6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin6<-cbind(anp_p,anp_tmin6, Periodo="2075-2099", Variable="Temperatura mínima", MGC ="GFDL_CM3_rcp45")
#plot(tmin6)
rm(tmin6)

tmin_GFDL_CM3_rcp45<-rbind(tmin_historico,anp_tmin4,anp_tmin5,anp_tmin6)
names(tmin_GFDL_CM3_rcp45)
rm(tmin_historico,anp_tmin4, anp_tmin5, anp_tmin6)

#HADGEM2_ES
anp_tmin.2<-cbind(anp_p,anp_tmin2, Periodo="1950-1979", Variable="Temperatura mínima", MGC ="HADGEM2_ES_rcp45")
anp_tmin.3<-cbind(anp_p,anp_tmin3, Periodo="1980-2009", Variable="Temperatura mínima", MGC ="HADGEM2_ES_rcp45")
tmin_historico<-rbind(anp_tmin.2,anp_tmin.3)
names(tmin_historico)

tmin4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaHADGEM2_ES_rcp45/*p4tmin*.tif"))
anp_tmin4 <- as.data.frame(raster::extract(tmin4, coor))
names(anp_tmin4)
colnames(anp_tmin4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin4<-cbind(anp_p,anp_tmin4, Periodo="2015-2039", Variable="Temperatura mínima", MGC ="HADGEM2_ES_rcp45")
#plot(tmin4)
rm(tmin4)

tmin5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaHADGEM2_ES_rcp45/*p5tmin*.tif"))
anp_tmin5 <- as.data.frame(raster::extract(tmin5, coor))
names(anp_tmin5)
colnames(anp_tmin5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin5<-cbind(anp_p,anp_tmin5, Periodo="2045-2069", Variable="Temperatura mínima", MGC ="HADGEM2_ES_rcp45")
#plot(tmin5)
rm(tmin5)

tmin6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaHADGEM2_ES_rcp45/*p6tmin*.tif"))
anp_tmin6 <- as.data.frame(raster::extract(tmin6, coor))
names(anp_tmin6)
colnames(anp_tmin6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin6<-cbind(anp_p,anp_tmin6, Periodo="2075-2099", Variable="Temperatura mínima", MGC ="HADGEM2_ES_rcp45")
#plot(tmin6)
rm(tmin6)

tmin_HADGEM2_ES_rcp45<-rbind(tmin_historico,anp_tmin4,anp_tmin5,anp_tmin6)
names(tmin_HADGEM2_ES_rcp45)
rm(tmin_historico,anp_tmin4, anp_tmin5, anp_tmin6)
#MPI_ESM_LR
anp_tmin.2<-cbind(anp_p,anp_tmin2, Periodo="1950-1979", Variable="Temperatura mínima", MGC ="MPI_ESM_LR_rcp45")
anp_tmin.3<-cbind(anp_p,anp_tmin3, Periodo="1980-2009", Variable="Temperatura mínima", MGC ="MPI_ESM_LR_rcp45")
tmin_historico<-rbind(anp_tmin.2,anp_tmin.3)
names(tmin_historico)

tmin4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaMPI_ESM_LR_rcp45/*p4tmin*.tif"))
anp_tmin4 <- as.data.frame(raster::extract(tmin4, coor))
names(anp_tmin4)
colnames(anp_tmin4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin4<-cbind(anp_p,anp_tmin4, Periodo="2015-2039", Variable="Temperatura mínima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmin4)
rm(tmin4)

tmin5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaMPI_ESM_LR_rcp45/*p5tmin*.tif"))
anp_tmin5 <- as.data.frame(raster::extract(tmin5, coor))
names(anp_tmin5)
colnames(anp_tmin5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin5<-cbind(anp_p,anp_tmin5, Periodo="2045-2069", Variable="Temperatura mínima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmin5)
rm(tmin5)

tmin6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TMinimaMPI_ESM_LR_rcp45/*p6tmin*.tif"))
anp_tmin6 <- as.data.frame(raster::extract(tmin6, coor))
names(anp_tmin6)
colnames(anp_tmin6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmin6<-cbind(anp_p,anp_tmin6, Periodo="2075-2099", Variable="Temperatura mínima", MGC ="MPI_ESM_LR_rcp45")
#plot(tmin6)
rm(tmin6)

tmin_MPI_ESM_LR_rcp45<-rbind(anp_tmin4,anp_tmin5,anp_tmin6)
names(tmin_MPI_ESM_LR_rcp45)
basesotatmin<-rbind(tmin_GFDL_CM3_rcp45,tmin_CNRMCM5_rcp45,tmin_HADGEM2_ES_rcp45,tmin_MPI_ESM_LR_rcp45)
rm(anp_tmin2,anp_tmin.2,anp_tmin.3,anp_tmin3,anp_tmin4, 
   anp_tmin5, anp_tmin6,tmin_historico, tmin_GFDL_CM3_rcp45,tmin_CNRMCM5_rcp45,tmin_HADGEM2_ES_rcp45,tmin_MPI_ESM_LR_rcp45)

#TPROMEDIO####
tmean2 <-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioCNRMCM5_rcp45/*p2tmean*.tif"))
anp_tmean2 <- as.data.frame(raster::extract(tmean2, coor))
names(anp_tmean2)
colnames(anp_tmean2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
#plot(tmean2)
rm(tmean2)

tmean3<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioCNRMCM5_rcp45/*p3tmean*.tif"))
anp_tmean3 <- as.data.frame(raster::extract(tmean3, coor))
names(anp_tmean3)
colnames(anp_tmean3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
#plot(tmean3)
rm(tmean3)

anp_tmean.2<-cbind(anp_p,anp_tmean2, Periodo="1950-1979", Variable="Temperatura promedio", MGC ="CNRMCM5_rcp45")
anp_tmean.3<-cbind(anp_p,anp_tmean3, Periodo="1980-2009", Variable="Temperatura promedio", MGC ="CNRMCM5_rcp45")
tmean_historico<-rbind(anp_tmean.2,anp_tmean.3)
names(tmean_historico)

tmean4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioCNRMCM5_rcp45/*p4tmean*.tif"))
anp_tmean4 <- as.data.frame(raster::extract(tmean4, coor))
names(anp_tmean4)
colnames(anp_tmean4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean4<-cbind(anp_p,anp_tmean4, Periodo="2015-2039", Variable="Temperatura promedio", MGC ="CNRMCM5_rcp45")
#plot(tmean4)
rm(tmean4)

tmean5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioCNRMCM5_rcp45/*p5tmean*.tif"))
anp_tmean5 <- as.data.frame(raster::extract(tmean5, coor))
names(anp_tmean5)
colnames(anp_tmean5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean5<-cbind(anp_p,anp_tmean5, Periodo="2045-2069", Variable="Temperatura promedio", MGC ="CNRMCM5_rcp45")
#plot(tmean5)
rm(tmean5)

tmean6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioCNRMCM5_rcp45/*p6tmean*.tif"))
anp_tmean6 <- as.data.frame(raster::extract(tmean6, coor))
names(anp_tmean6)
colnames(anp_tmean6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean6<-cbind(anp_p,anp_tmean6, Periodo="2075-2099", Variable="Temperatura promedio", MGC ="CNRMCM5_rcp45")
#plot(tmean6)
rm(tmean6)

tmean_CNRMCM5_rcp45<-rbind(tmean_historico,anp_tmean4,anp_tmean5,anp_tmean6)
names(tmean_CNRMCM5_rcp45)
rm(anp_tmean4, anp_tmean5, anp_tmean6)

#GFDL_CM3
anp_tmean.2<-cbind(anp_p,anp_tmean2, Periodo="1950-1979", Variable="Temperatura promedio", MGC ="GFDL_CM3_rcp45")
anp_tmean.3<-cbind(anp_p,anp_tmean3, Periodo="1980-2009", Variable="Temperatura promedio", MGC ="GFDL_CM3_rcp45")
tmean_historico<-rbind(anp_tmean.2,anp_tmean.3)
names(tmean_historico)

tmean4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioGFDL_CM3_rcp45/*p4tprom*.tif"))
anp_tmean4 <- as.data.frame(raster::extract(tmean4, coor))
names(anp_tmean4)
colnames(anp_tmean4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean4<-cbind(anp_p,anp_tmean4, Periodo="2015-2039", Variable="Temperatura promedio", MGC ="GFDL_CM3_rcp45")
#plot(tmean4)
rm(tmean4)

tmean5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioGFDL_CM3_rcp45/*p5tprom*.tif"))
anp_tmean5 <- as.data.frame(raster::extract(tmean5, coor))
names(anp_tmean5)
colnames(anp_tmean5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean5<-cbind(anp_p,anp_tmean5, Periodo="2045-2069", Variable="Temperatura promedio", MGC ="GFDL_CM3_rcp45")
#plot(tmean5)
rm(tmean5)

tmean6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioGFDL_CM3_rcp45/*p6tprom*.tif"))
anp_tmean6 <- as.data.frame(raster::extract(tmean6, coor))
names(anp_tmean6)
colnames(anp_tmean6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean6<-cbind(anp_p,anp_tmean6, Periodo="2075-2099", Variable="Temperatura promedio", MGC ="GFDL_CM3_rcp45")
#plot(tmean6)
rm(tmean6)

tmean_GFDL_CM3_rcp45<-rbind(tmean_historico,anp_tmean4,anp_tmean5,anp_tmean6)
names(tmean_GFDL_CM3_rcp45)
rm(anp_tmean4, anp_tmean5, anp_tmean6)
#HADGEM2_ES
anp_tmean.2<-cbind(anp_p,anp_tmean2, Periodo="1950-1979", Variable="Temperatura promedio", MGC ="HADGEM2_ES_rcp45")
anp_tmean.3<-cbind(anp_p,anp_tmean3, Periodo="1980-2009", Variable="Temperatura promedio", MGC ="HADGEM2_ES_rcp45")
tmean_historico<-rbind(anp_tmean.2,anp_tmean.3)
names(tmean_historico)

tmean4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioHADGEM2_ES_rcp45/*p4tprom*.tif"))
anp_tmean4 <- as.data.frame(raster::extract(tmean4, coor))
names(anp_tmean4)
colnames(anp_tmean4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean4<-cbind(anp_p,anp_tmean4, Periodo="2015-2039", Variable="Temperatura promedio", MGC ="HADGEM2_ES_rcp45")
#plot(tmean4)
rm(tmean4)

tmean5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioHADGEM2_ES_rcp45/*p5tprom*.tif"))
anp_tmean5 <- as.data.frame(raster::extract(tmean5, coor))
names(anp_tmean5)
colnames(anp_tmean5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean5<-cbind(anp_p,anp_tmean5, Periodo="2045-2069", Variable="Temperatura promedio", MGC ="HADGEM2_ES_rcp45")
#plot(tmean5)
rm(tmean5)

tmean6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioHADGEM2_ES_rcp45/*p6tprom*.tif"))
anp_tmean6 <- as.data.frame(raster::extract(tmean6, coor))
names(anp_tmean6)
colnames(anp_tmean6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean6<-cbind(anp_p,anp_tmean6, Periodo="2075-2099", Variable="Temperatura promedio", MGC ="HADGEM2_ES_rcp45")
#plot(tmean6)
rm(tmean6)

tmean_HADGEM2_ES_rcp45<-rbind(tmean_historico,anp_tmean4,anp_tmean5,anp_tmean6)
names(tmean_HADGEM2_ES_rcp45)
rm(anp_tmean4, anp_tmean5, anp_tmean6)

#MPI_ESM_LR
anp_tmean.2<-cbind(anp_p,anp_tmean2, Periodo="1950-1979", Variable="Temperatura promedio", MGC ="MPI_ESM_LR_rcp45")
anp_tmean.3<-cbind(anp_p,anp_tmean3, Periodo="1980-2009", Variable="Temperatura promedio", MGC ="MPI_ESM_LR_rcp45")
tmean_historico<-rbind(anp_tmean.2,anp_tmean.3)
names(tmean_historico)

tmean4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioMPI_ESM_LR_rcp45/*p4Tmean*.tif"))
anp_tmean4 <- as.data.frame(raster::extract(tmean4, coor))
names(anp_tmean4)
colnames(anp_tmean4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean4<-cbind(anp_p,anp_tmean4, Periodo="2015-2039", Variable="Temperatura promedio", MGC ="MPI_ESM_LR_rcp45")
#plot(tmean4)
rm(tmean4)

tmean5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioMPI_ESM_LR_rcp45/*p5Tmean*.tif"))
anp_tmean5 <- as.data.frame(raster::extract(tmean5, coor))
names(anp_tmean5)
colnames(anp_tmean5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean5<-cbind(anp_p,anp_tmean5, Periodo="2045-2069", Variable="Temperatura promedio", MGC ="MPI_ESM_LR_rcp45")
#plot(tmean5)
rm(tmean5)

tmean6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/TPromedioMPI_ESM_LR_rcp45/*p6Tmean*.tif"))
anp_tmean6 <- as.data.frame(raster::extract(tmean6, coor))
names(anp_tmean6)
colnames(anp_tmean6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                        "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_tmean6<-cbind(anp_p,anp_tmean6, Periodo="2075-2099", Variable="Temperatura promedio", MGC ="MPI_ESM_LR_rcp45")
#plot(tmean6)
rm(tmean6)

tmean_MPI_ESM_LR_rcp45<-rbind(tmean_historico,anp_tmean4,anp_tmean5,anp_tmean6)
names(tmean_MPI_ESM_LR_rcp45)

basesotatmean<-rbind(tmean_GFDL_CM3_rcp45,tmean_CNRMCM5_rcp45,tmean_HADGEM2_ES_rcp45,tmean_MPI_ESM_LR_rcp45)
rm(anp_tmean2,anp_tmean3,anp_tmean4, anp_tmean5, anp_tmean6,tmean_historico, 
   tmean_GFDL_CM3_rcp45,tmean_CNRMCM5_rcp45,tmean_HADGEM2_ES_rcp45,tmean_MPI_ESM_LR_rcp45)

#PRECIPITACION####
#CNRMCM5

prec2 <-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionCNRMCM5_rcp45/*p2prec*.tif"))
anp_prec2 <- as.data.frame(raster::extract(prec2, coor))
names(anp_prec2)
colnames(anp_prec2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

#plot(prec2)
rm(prec2)

prec3<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionCNRMCM5_rcp45/*p3prec*.tif"))
anp_prec3 <- as.data.frame(raster::extract(prec3, coor))
names(anp_prec3)
colnames(anp_prec3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
#plot(prec3)
rm(prec3)

anp_prec.2<-cbind(anp_p,anp_prec2, Periodo="1950-1979", Variable="Precipitación", MGC ="CNRMCM5_rcp45")
anp_prec.3<-cbind(anp_p,anp_prec3, Periodo="1980-2009", Variable="Precipitación", MGC ="CNRMCM5_rcp45")
prec_historico<-rbind(anp_prec.2,anp_prec.3)
names(prec_historico)

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionCNRMCM5_rcp45/*p4prec*.tif"))
anp_prec4 <- as.data.frame(raster::extract(prec4, coor))
names(anp_prec4)
colnames(anp_prec4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec4<-cbind(anp_p,anp_prec4, Periodo="2015-2039", Variable="Precipitación", MGC ="CNRMCM5_rcp45")
#plot(prec4)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionCNRMCM5_rcp45/*p5prec*.tif"))
anp_prec5 <- as.data.frame(raster::extract(prec5, coor))
names(anp_prec5)
colnames(anp_prec5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec5<-cbind(anp_p,anp_prec5, Periodo="2045-2069", Variable="Precipitación", MGC ="CNRMCM5_rcp45")
#plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionCNRMCM5_rcp45/*p6prec*.tif"))
anp_prec6 <- as.data.frame(raster::extract(prec6, coor))
names(anp_prec6)
colnames(anp_prec6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec6<-cbind(anp_p,anp_prec6, Periodo="2075-2099", Variable="Precipitación", MGC ="CNRMCM5_rcp45")
#plot(prec6)
rm(prec6)

prec_CNRMCM5_rcp45<-rbind(prec_historico,anp_prec4,anp_prec5,anp_prec6)
names(prec_CNRMCM5_rcp45)
rm(anp_prec4, anp_prec5, anp_prec6)

#GFDL_CM3
anp_prec.2<-cbind(anp_p,anp_prec2, Periodo="1950-1979", Variable="Precipitación", MGC ="GFDL_CM3_rcp45")
anp_prec.3<-cbind(anp_p,anp_prec3, Periodo="1980-2009", Variable="Precipitación", MGC ="GFDL_CM3_rcp45")
prec_historico<-rbind(anp_prec.2,anp_prec.3)
names(prec_historico)

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionGFDL_CM3_rcp45/*p4prec*.tif"))
anp_prec4 <- as.data.frame(raster::extract(prec4, coor))
names(anp_prec4)
colnames(anp_prec4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec4<-cbind(anp_p,anp_prec4, Periodo="2015-2039", Variable="Precipitación", MGC ="GFDL_CM3_rcp45")
#plot(prec4)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionGFDL_CM3_rcp45/*p5prec*.tif"))
anp_prec5 <- as.data.frame(raster::extract(prec5, coor))
names(anp_prec5)
colnames(anp_prec5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec5<-cbind(anp_p,anp_prec5, Periodo="2045-2069", Variable="Precipitación", MGC ="GFDL_CM3_rcp45")
#plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionGFDL_CM3_rcp45/*p6prec*.tif"))
anp_prec6 <- as.data.frame(raster::extract(prec6, coor))
names(anp_prec6)
colnames(anp_prec6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec6<-cbind(anp_p,anp_prec6, Periodo="2075-2099", Variable="Precipitación", MGC ="GFDL_CM3_rcp45")
#plot(prec6)
rm(prec6)

prec_GFDL_CM3_rcp45<-rbind(prec_historico,anp_prec4,anp_prec5,anp_prec6)
names(prec_GFDL_CM3_rcp45)
rm(anp_prec4, anp_prec5, anp_prec6)

#HADGEM2_ES
anp_prec.2<-cbind(anp_p,anp_prec2, Periodo="1950-1979", Variable="Precipitación", MGC ="HADGEM2_ES_rcp45")
anp_prec.3<-cbind(anp_p,anp_prec3, Periodo="1980-2009", Variable="Precipitación", MGC ="HADGEM2_ES_rcp45")
prec_historico<-rbind(anp_prec.2,anp_prec.3)
names(prec_historico)

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionHADGEM2_ES_rcp45/*p4prec*.tif"))
anp_prec4 <- as.data.frame(raster::extract(prec4, coor))
names(anp_prec4)
colnames(anp_prec4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec4<-cbind(anp_p,anp_prec4, Periodo="2015-2039", Variable="Precipitación", MGC ="HADGEM2_ES_rcp45")
#plot(prec4)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionHADGEM2_ES_rcp45/*p5prec*.tif"))
anp_prec5 <- as.data.frame(raster::extract(prec5, coor))
names(anp_prec5)
colnames(anp_prec5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec5<-cbind(anp_p,anp_prec5, Periodo="2045-2069", Variable="Precipitación", MGC ="HADGEM2_ES_rcp45")
#plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionHADGEM2_ES_rcp45/*p6prec*.tif"))
anp_prec6 <- as.data.frame(raster::extract(prec6, coor))
names(anp_prec6)
colnames(anp_prec6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec6<-cbind(anp_p,anp_prec6, Periodo="2075-2099", Variable="Precipitación", MGC ="HADGEM2_ES_rcp45")
#plot(prec6)
rm(prec6)

prec_HADGEM2_ES_rcp45<-rbind(prec_historico,anp_prec4,anp_prec5,anp_prec6)
names(prec_HADGEM2_ES_rcp45)
rm(anp_prec4, anp_prec5, anp_prec6)
#MPI_ESM_LR
anp_prec.2<-cbind(anp_p,anp_prec2, Periodo="1950-1979", Variable="Precipitación", MGC ="MPI_ESM_LR_rcp45")
anp_prec.3<-cbind(anp_p,anp_prec3, Periodo="1980-2009", Variable="Precipitación", MGC ="MPI_ESM_LR_rcp45")
prec_historico<-rbind(anp_prec.2,anp_prec.3)
names(prec_historico)

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionMPI_ESM_LR_rcp45/*p4prec*.tif"))
anp_prec4 <- as.data.frame(raster::extract(prec4, coor))
names(anp_prec4)
colnames(anp_prec4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec4<-cbind(anp_p,anp_prec4, Periodo="2015-2039", Variable="Precipitación", MGC ="MPI_ESM_LR_rcp45")
#plot(prec4)
rm(prec4)

prec5<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionMPI_ESM_LR_rcp45/*p5prec*.tif"))
anp_prec5 <- as.data.frame(raster::extract(prec5, coor))
names(anp_prec5)
colnames(anp_prec5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec5<-cbind(anp_p,anp_prec5, Periodo="2045-2069", Variable="Precipitación", MGC ="MPI_ESM_LR_rcp45")
#plot(prec5)
rm(prec5)

prec6<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/PrecipitacionMPI_ESM_LR_rcp45/*p6prec*.tif"))
anp_prec6 <- as.data.frame(raster::extract(prec6, coor))
names(anp_prec6)
colnames(anp_prec6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")
anp_prec6<-cbind(anp_p,anp_prec6, Periodo="2075-2099", Variable="Precipitación", MGC ="MPI_ESM_LR_rcp45")
#plot(prec6)
rm(prec6)

prec_MPI_ESM_LR_rcp45<-rbind(prec_historico,anp_prec4,anp_prec5,anp_prec6)
names(prec_MPI_ESM_LR_rcp45)

basesotaprec<-rbind(prec_GFDL_CM3_rcp45,prec_CNRMCM5_rcp45,prec_HADGEM2_ES_rcp45,prec_MPI_ESM_LR_rcp45)
rm(anp_tmean.2,anp_tmean.3,anp_prec.2,anp_prec.3,anp_prec2,anp_prec3,anp_prec4, anp_prec5, anp_prec6,prec_historico, 
   prec_GFDL_CM3_rcp45,prec_CNRMCM5_rcp45,prec_HADGEM2_ES_rcp45,prec_MPI_ESM_LR_rcp45)

#BIND###
base<-rbind(basesotaprec,basesotatmean,basesotatmin,basesotatmx)
write.csv(base,"bases/baseclimapais.csv", fileEncoding = "UTF-8")
  
