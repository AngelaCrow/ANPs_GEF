

library("raster")
library("rgdal")
library("sp")
library("rgeos")
library("maptools")

rm(list = ls())
#ANP
anp<-readOGR(dsn="E:/3.CONABIO-IBUNAM_CC/anps_2017_todas/anp_xy.shp",layer="anp_xy")
#plot(anp)
projection(anp) <- CRS("+proj=longlat")
names(anp)

#Ecoregion
eco<-readOGR(dsn="E:/3.CONABIO-IBUNAM_CC/ecoregion/ecort08g_N3.shp",layer="ecort08g_N3")
projection(eco) <- CRS("+proj=longlat")

#Unir ANP y ecoregion
anp_eco<-over(anp, eco)
anp_p<-cbind.data.frame(anp, anp_eco)
names(anp_p)

coor<-anp_p[c(4:5)]
head(coor)


#------------CLIMATICAS ANUAL "1950-1979"
v_anual2<-list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE)
anual2<-stack(v_anual2)
va_2<-anual2[[c("p2bio01", "p2bio12", "p2bio08", "p2bio09", "p2bio16", "p2bio17")]]
names(va_2)

p2ETPp<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo_anual/ETPp(1950-1979)_tiff_g.tif")
plot(p2ETPp)

variables2<-stack(va_2,p2ETPp)
plot(variables2)

names(variables2)[1]<-"bio01"
names(variables2)[2]<-"bio12"
names(variables2)[3]<-"bio08"
names(variables2)[4]<-"bio09"
names(variables2)[5]<-"bio16"
names(variables2)[6]<-"bio17"
names(variables2)[7]<-"ETP"

rm(v_anual2,anual2, va_2,p2ETPp)

#------------CLIMATICAS ANUAL "1950-1979"
v_anual3<-list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Bios/Bios(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE)
anual3<-stack(v_anual3)
plot(anual3)
va_3<-anual3[[c("p3bio01", "p3bio12", "p3bio08", "p3bio09", "p3bio16", "p3bio17")]]
plot(va_3)

p3ETPp<-raster("E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo_anual/ETPp(1980-2009)_tiff_g.tif")
plot(p3ETPp)

variables3<-stack(va_3,p3ETPp)
names(variables3)

names(variables3)[1]<-"bio01"
names(variables3)[2]<-"bio12"
names(variables3)[3]<-"bio08"
names(variables3)[4]<-"bio09"
names(variables3)[5]<-"bio16"
names(variables3)[6]<-"bio17"
names(variables3)[7]<-"ETP"

rm(v_anual3,anual3, va_3,p3ETPp)
#------------CLIMATICAS ANUAL "rcp45_2015-2039"
v_anual4<-list.files(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_bio/", pattern='*.tif$', full.names=TRUE)
anual4<-stack(v_anual4[2:20])
bio.p4<-c("p4bio_CNRMCM5_rcp85_01","p4bio_CNRMCM5_rcp85_10", "p4bio_CNRMCM5_rcp85_11","p4bio_CNRMCM5_rcp85_12",
          "p4bio_CNRMCM5_rcp85_13","p4bio_CNRMCM5_rcp85_14","p4bio_CNRMCM5_rcp85_15","p4bio_CNRMCM5_rcp85_16",
          "p4bio_CNRMCM5_rcp85_17","p4bio_CNRMCM5_rcp85_18", "p4bio_CNRMCM5_rcp85_19","p4bio_CNRMCM5_rcp85_02",
          "p4bio_CNRMCM5_rcp85_03","p4bio_CNRMCM5_rcp85_04","p4bio_CNRMCM5_rcp85_05", "p4bio_CNRMCM5_rcp85_06",
          "p4bio_CNRMCM5_rcp85_07", "p4bio_CNRMCM5_rcp85_08", "p4bio_CNRMCM5_rcp85_09")
names(anual4)<-(bio.p4)
plot(anual4)
va_4<-anual4[[c(1,4,8,9,18,19)]]
plot(va_4)

p4ETPf<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_AET_ETP/ETPf.tif")
#plot(p4ETPf)

variables4<-stack(va_4,p4ETPf)
names(variables4)

names(variables4)[1]<-"bio01"
names(variables4)[2]<-"bio12"
names(variables4)[3]<-"bio16"
names(variables4)[4]<-"bio17"
names(variables4)[5]<-"bio08"
names(variables4)[6]<-"bio09"
names(variables4)[7]<-"ETP"
rm(v_anual4,anual4, va_4,p4ETPf,bio.p4)
#------------CLIMATICAS ANUAL "rcp45_2045-2069"
v_anual5<-list.files(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_bio/", pattern='*.tif$', full.names=TRUE)
anual5<-stack(v_anual5[2:20])
bio.p5<-c("p5bio_CNRMCM5_rcp85_01","p5bio_CNRMCM5_rcp85_10", "p5bio_CNRMCM5_rcp85_11","p5bio_CNRMCM5_rcp85_12",
          "p5bio_CNRMCM5_rcp85_13","p5bio_CNRMCM5_rcp85_14","p5bio_CNRMCM5_rcp85_15","p5bio_CNRMCM5_rcp85_16",
          "p5bio_CNRMCM5_rcp85_17","p5bio_CNRMCM5_rcp85_18", "p5bio_CNRMCM5_rcp85_19","p5bio_CNRMCM5_rcp85_02",
          "p5bio_CNRMCM5_rcp85_03","p5bio_CNRMCM5_rcp85_04","p5bio_CNRMCM5_rcp85_05", "p5bio_CNRMCM5_rcp85_06",
          "p5bio_CNRMCM5_rcp85_07", "p5bio_CNRMCM5_rcp85_08", "p5bio_CNRMCM5_rcp85_09")
names(anual5)<-(bio.p5)
names(anual5)
va_5<-anual5[[c(1,4,8,9,18,19)]]
#plot(va_5)

p5ETPp<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_AET_ETP/ETPf.tif")
#plot(p4ETPp)

variables5<-stack(va_5,p5ETPp)
names(variables5)

names(variables5)[1]<-"bio01"
names(variables5)[2]<-"bio12"
names(variables5)[3]<-"bio16"
names(variables5)[4]<-"bio17"
names(variables5)[5]<-"bio08"
names(variables5)[6]<-"bio09"
names(variables5)[7]<-"ETP"
rm(v_anual5,anual5, va_5,p5ETPp)
#------------CLIMATICAS ANUAL "rcp45_2075-2099"
v_anual6<-list.files(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_bio/", pattern='*.tif$', full.names=TRUE)
anual6<-stack(v_anual6[2:20])
names(anual6)
bio.p6<-c("p6bio_CNRMCM5_rcp85_01","p6bio_CNRMCM5_rcp85_10", "p6bio_CNRMCM5_rcp85_11","p6bio_CNRMCM5_rcp85_12",
              "p6bio_CNRMCM5_rcp85_13","p6bio_CNRMCM5_rcp85_14","p6bio_CNRMCM5_rcp85_15","p6bio_CNRMCM5_rcp85_16",
              "p6bio_CNRMCM5_rcp85_17","p6bio_CNRMCM5_rcp85_18", "p6bio_CNRMCM5_rcp85_19","p6bio_CNRMCM5_rcp85_02",
              "p6bio_CNRMCM5_rcp85_03","p6bio_CNRMCM5_rcp85_04","p6bio_CNRMCM5_rcp85_05", "p6bio_CNRMCM5_rcp85_06",
              "p6bio_CNRMCM5_rcp85_07", "p6bio_CNRMCM5_rcp85_08", "p6bio_CNRMCM5_rcp85_09")
names(anual6)<-(bio.p6)
names(anual6)
va_6<-anual6[[c(1,4,8,9,18,19)]]
plot(va_6)

p6ETPp<-raster("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_AET_ETP/ETPf.tif")
#plot(p6ETPp)

variables6<-stack(va_6,p6ETPp)
names(variables6)

names(variables6)[1]<-"bio01"
names(variables6)[2]<-"bio12"
names(variables6)[3]<-"bio16"
names(variables6)[4]<-"bio17"
names(variables6)[5]<-"bio08"
names(variables6)[6]<-"bio09"
names(variables6)[7]<-"ETP"
rm(v_anual6,anual6, va_6,p6ETPp,bio.p6)
#--------------
#unir variables y base con ANP y ecoregiones
#anpvar1<- as.data.frame(extract(variables1, coor))
#anp_var1<-cbind(anp_p, anpvar1, Periodo="1910-1949")
#names(anp_var1)

anpvar2<- as.data.frame(extract(variables2, coor))
anp_var2<-cbind(anp_p, anpvar2, Periodo="1950-1979", MGC ="CNRMCM5 RCP 4.5")
names(anp_var2)
anpvar3<- as.data.frame(extract(variables3, coor))
anp_var3<-cbind(anp_p, anpvar3, Periodo="1980-2009",MGC ="CNRMCM5 RCP 4.5")
names(anp_var3)
anpvar4<- as.data.frame(extract(variables4, coor))
anp_var4<-cbind(anp_p, anpvar4, Periodo="2015-2039", MGC ="CNRMCM5 RCP 4.5")
names(anp_var4)
anpvar5<- as.data.frame(extract(variables5, coor))
anp_var5<-cbind(anp_p, anpvar5, Periodo="2045-2069", MGC ="CNRMCM5 RCP 4.5")
names(anp_var5)
anpvar6<- as.data.frame(extract(variables6, coor))
anp_var6<-cbind(anp_p, anpvar6, Periodo="2075-2099", MGC ="CNRMCM5 RCP 4.5")
names(anp_var6)


anp_anual<-rbind(anp_var2, anp_var3, anp_var4,anp_var5,anp_var6)
head(anp_anual)
dir.create("bases")
write.csv(anp_anual, "bases/CNRMCM5_rcp45anp_anual_g.csv",fileEncoding = "UTF-8")
rm(variables2,variables3,variables4, variables5, variables6, anp_var2,
   anp_var3,anp_var4,anp_var5,anp_var6,anpvar2, anpvar3,anpvar4,anpvar5,anpvar6,
   bio.p4,bio.p5,bio.p6)

#MENSUAL####
#CLIMATICAS MENSUAL "1910-1949"####

evom2<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo/Evo(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(evom2)

tmax2<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmax/Tmax(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tmax2)

tmin2<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmin/Tmin(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tmin2)

tpro2<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmean/Tmean(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tpro2)

prec2<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Prec/Prec(1950-1979)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(prec2)

#extraer mes
anp_evom2 <- as.data.frame(extract(evom2, coor))
anp_tmax2 <- as.data.frame(extract(tmax2, coor))
anp_tmin2 <- as.data.frame(extract(tmin2, coor))
anp_tpro2 <- as.data.frame(extract(tpro2, coor))
anp_prec2 <- as.data.frame(extract(prec2, coor))
head(anp_prec2)

#colnames(anp_evom2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
 #                      "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

colnames(anp_tmax2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

colnames(anp_tmin2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

colnames(anp_tpro2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

colnames(anp_prec2)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

head(anp_prec2)

#Unir base con variables
#anpevom2<-cbind(anp_p,anp_evom2, Periodo="1950-1979", Variable="Evotranspiracion", MGC ="CNRMCM5 RCP 4.5")
anptmax2<-cbind(anp_p,anp_tmax2, Periodo="1950-1979", Variable="Tmax", MGC ="CNRMCM5 RCP 4.5")
anptmin2<-cbind(anp_p,anp_tmin2, Periodo="1950-1979", Variable="Tmin", MGC ="CNRMCM5 RCP 4.5")
anptpro2<-cbind(anp_p,anp_tpro2, Periodo="1950-1979", Variable="Tpro", MGC ="CNRMCM5 RCP 4.5")
anpprec2<-cbind(anp_p,anp_prec2, Periodo="1950-1979", Variable="Prec", MGC ="CNRMCM5 RCP 4.5")
names(anpprec2)

mensual2<-rbind(anptmax2,anptmin2,anptpro2, anpprec2)
names(mensual2)

rm(tmax2, tmin2, prec2, tpro2, anpevom2, anptmax2, anptmin2, anptpro2, anpprec2, 
   anp_prec2, anp_tmax2, anp_tmin2, anp_tpro2, anp_tmax2,anp_tmin2,anp_tpro2, anp_prec2)
#-------------------------------------------------------
#CLIMATICAS MENSUAL "1980-2009"####
evom3<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo/Evo(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(evom3)

tmax3<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmax/Tmax(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tmax3)

tmin3<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmin/Tmin(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tmin3)

tpro3<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Tmean/Tmean(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(tpro3)

prec3<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Prec/Prec(1980-2009)_tiff_g", pattern='*.tif$', full.names=TRUE))
plot(prec3)

#extraer mes
anp_evom3 <- as.data.frame(extract(evom3, coor))
anp_tmax3 <- as.data.frame(extract(tmax3, coor))
anp_tmin3 <- as.data.frame(extract(tmin3, coor))
anp_tpro3 <- as.data.frame(extract(tpro3, coor))
anp_prec3 <- as.data.frame(extract(prec3, coor))
head(anp_prec3)

colnames(anp_evom3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmax3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmin3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tpro3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_prec3)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

head(anp_prec3)

#Unir base con variables
#anpevom3<-cbind(anp_p,anp_evom3, Periodo="1980-2009", Variable="Evotranspiracion", MGC ="CNRMCM5 RCP 4.5")
anptmax3<-cbind(anp_p,anp_tmax3, Periodo="1980-2009", Variable="Tmax", MGC ="CNRMCM5 RCP 4.5")
names(anptmax3)
anptmin3<-cbind(anp_p,anp_tmin3, Periodo="1980-2009", Variable="Tmin", MGC ="CNRMCM5 RCP 4.5")
names(anptmin3)
anptpro3<-cbind(anp_p,anp_tpro3, Periodo="1980-2009", Variable="Tpro", MGC ="CNRMCM5 RCP 4.5")
names(anptpro3)
anpprec3<-cbind(anp_p,anp_prec3, Periodo="1980-2009", Variable="Prec", MGC ="CNRMCM5 RCP 4.5")
names(anpprec3)

mensual3<-rbind(anptmax3,anptmin3, anptpro3, anpprec3)
names(mensual3)
rm(tmax3, tmin3, prec3, tpro3, anpevom3, anptmax3, anptmin3, anptpro3, anpprec3,anpprec3, anptmax3, anptmin3, anptpro3, varmes3, 
   anp_tmax3,anp_tmin3, anp_tpro3, anp_prec3)

#CLIMATICAS MENSUAL "2015-2039"####
#evom4<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo/Evo(2015-2039)_tiff_g", pattern='*p4*.tif$', full.names=TRUE))
#plot(evom4)

tmax4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_tmax/*p4*.tif"))
plot(tmax4)

tmin4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_tmin/*p4*.tif"))
plot(tmin4)

tpro4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_tprom/*p4*.tif"))
plot(tpro4)

prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2015-2039_prec/*p4*.tif"))
plot(prec4)

#extraer mes
anp_evom4 <- as.data.frame(extract(evom4, coor))
anp_tmax4 <- as.data.frame(extract(tmax4, coor))
anp_tmin4 <- as.data.frame(extract(tmin4, coor))
anp_tpro4 <- as.data.frame(extract(tpro4, coor))
anp_prec4 <- as.data.frame(extract(prec4, coor))
head(anp_prec4)

#colnames(anp_evom4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
#                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmax4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmin4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tpro4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_prec4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

head(anp_prec4)

#Unir base con variables
#anpevom4<-cbind(anp_p,anp_evom4, Periodo="2015-2039", Variable="Evotranspiracion")
anptmax4<-cbind(anp_p,anp_tmax4, Periodo="2015-2039", Variable="Tmax", MGC ="CNRMCM5 RCP 4.5")
anptmin4<-cbind(anp_p,anp_tmin4, Periodo="2015-2039", Variable="Tmin", MGC ="CNRMCM5 RCP 4.5")
anptpro4<-cbind(anp_p,anp_tpro4, Periodo="2015-2039", Variable="Tpro", MGC ="CNRMCM5 RCP 4.5")
anpprec4<-cbind(anp_p,anp_prec4, Periodo="2015-2039", Variable="Prec", MGC ="CNRMCM5 RCP 4.5")
names(anpprec4)

mensual4<-rbind(anptmax4,anptmin4, anptpro4, anpprec4)
names(mensual4)
head(mensual4)
rm(tmax4, tmin4, prec4, tpro4, anpevom4, anptmax4, anptmin4, anptpro4, anpprec4,anptmax4,anptmin4, anptpro4, anpprec4,
   anp_tmax4,anp_tmin4, anp_tpro4, anp_prec4)
#------------CLIMATICAS MENSUAL "2045-2069"
#evom4<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo/Evo(2045-2069)_tiff_g", pattern='*.tif$', full.names=TRUE))
#plot(evom4)

tmax5<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_tmax/*p5*.tif"))
plot(tmax5)

tmin5<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_tmin/*p5*.tif"))
plot(tmin5)

tpro5<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_tprom/*p5*.tif"))
plot(tpro5)

prec5<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2045-2069_prec/*p5*.tif"))
plot(prec5)

#extraer mes
#anp_evom4 <- as.data.frame(extract(evom4, coor))
anp_tmax5 <- as.data.frame(extract(tmax5, coor))
anp_tmin5 <- as.data.frame(extract(tmin5, coor))
anp_tpro5 <- as.data.frame(extract(tpro5, coor))
anp_prec5 <- as.data.frame(extract(prec5, coor))
#head(anp_prec5)

#colnames(anp_evom4)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
#                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmax5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmin5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tpro5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_prec5)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

head(anp_prec5)

#Unir base con variables
#anpevom4<-cbind(anp_p,anp_evom4, Periodo="2045-2069", Variable="Evotranspiracion")
anptmax5<-cbind(anp_p,anp_tmax5, Periodo="2045-2069", Variable="Tmax", MGC ="CNRMCM5 RCP 4.5")
anptmin5<-cbind(anp_p,anp_tmin5, Periodo="2045-2069", Variable="Tmin", MGC ="CNRMCM5 RCP 4.5")
anptpro5<-cbind(anp_p,anp_tpro5, Periodo="2045-2069", Variable="Tpro", MGC ="CNRMCM5 RCP 4.5")
anpprec5<-cbind(anp_p,anp_prec5, Periodo="2045-2069", Variable="Prec", MGC ="CNRMCM5 RCP 4.5")
names(anpprec5)

mensual5<-rbind(anptmax5,anptmin5, anptpro5, anpprec5)
names(mensual5)
head(mensual5)
rm(tmax5, tmin5, prec5, tpro5, anptmax5, anptmin5, anptpro5, anpprec5, anptmax5,anptmin5, anptpro5, anpprec5,
   anp_tmax5,anp_tmin5, anp_tpro5, anp_prec5)

#------------CLIMATICAS MENSUAL "2075-2099"
#evom6<-stack(list.files(path="E:/3.CONABIO-IBUNAM_CC/reporte_sep17/entrega_sep17_CNMA/capas/capas_g/tiff/Evo/Evo(2075-2099)_tiff_g", pattern='*.tif$', full.names=TRUE))
#plot(evom6)

tmax6<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_tmax/*p6*.tif"))
plot(tmax6)

tmin6<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_tmin/*p6*.tif"))
plot(tmin6)

tpro6<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_tprom/*p6*.tif"))
plot(tpro6)

prec6<-stack(Sys.glob(path="E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp45_2075-2099_prec/*p6*.tif"))
plot(prec6)

#extraer mes
#anp_evom6 <- as.data.frame(extract(evom6, coor))
anp_tmax6 <- as.data.frame(extract(tmax6, coor))
anp_tmin6 <- as.data.frame(extract(tmin6, coor))
anp_tpro6 <- as.data.frame(extract(tpro6, coor))
anp_prec6 <- as.data.frame(extract(prec6, coor))
#head(anp_prec6)

#colnames(anp_evom6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
#                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmax6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tmin6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_tpro6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

colnames(anp_prec6)<-c("Enero", "Febrero", "Marzo","Abril","Mayo", "Junio", "Julio",
                       "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre")

head(anp_prec6)

#Unir base con variables
#anpevom6<-cbind(anp_p,anp_evom6, Periodo="2075-2099", Variable="Evotranspiracion")
anptmax6<-cbind(anp_p,anp_tmax6, Periodo="2075-2099", Variable="Tmax", MGC ="CNRMCM5 RCP 4.5")
anptmin6<-cbind(anp_p,anp_tmin6, Periodo="2075-2099", Variable="Tmin", MGC ="CNRMCM5 RCP 4.5")
anptpro6<-cbind(anp_p,anp_tpro6, Periodo="2075-2099", Variable="Tpro", MGC ="CNRMCM5 RCP 4.5")
anpprec6<-cbind(anp_p,anp_prec6, Periodo="2075-2099", Variable="Prec", MGC ="CNRMCM5 RCP 4.5")
names(anpprec6)

mensual6<-rbind(anptmax6,anptmin6, anptpro6, anpprec6)
names(mensual6)
head(mensual6)
rm(tmax6, tmin6, prec6, tpro6, anptmax6, anptmin6, anptpro6, anpprec6,anp_tmax6,anp_tmin6, anp_tpro6, anp_prec6)

#------------------------BASE TOTAL MENSUAL
mes<-rbind.data.frame(mensual2, mensual3, mensual4,mensual5,mensual6)
head(mes)

write.csv(mes, "/bases/CNRMCM5_rcp45anp_mes_g.csv", fileEncoding = "UTF-8")
