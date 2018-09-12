library(raster)
library(purrr)
library(dplyr)
library(ggplot2)
library(ggrepel)

anps_todas<-read.csv("anps_fed_terrestres2018.csv")
names(anps_todas)

anp_coor <- anps_todas[c("POINT_X", "POINT_Y")]

#####CNRMCM5_####
MK_Pvalue<-raster("data_mk/PrecipitacionCNRMCM5_rcp45_MK_P.tif")
names(MK_Pvalue)<-"MK_P"
MK_TAU<-raster("data_mk/PrecipitacionCNRMCM5_rcp45_MK_tau.tif")
names(MK_TAU)<-"MK_TAU"
MK_Z<-raster("data_mk/PrecipitacionCNRMCM5_rcp45_MK_Z.tif")
names(MK_Z)<-"MK_Z"

rcp45.p<-data.frame(extract(MK_Pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(MK_TAU,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(MK_Z,anp_coor), Variable="z")
names(rcp45.z)[1]<-"Valor"

rcp45<-rbind(rcp45.tau, rcp45.p,rcp45.z)
names(rcp45)
head(rcp45)

base.df<-cbind(rcp45, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(Promedio=mean(Valor), 
                                                var= var(Valor),
                                                Área =unique(Area_km),
                                                Área_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=Promedio-var,
                                     variable_max=Promedio+var,ID_anp=1:length(Promedio)))

write.csv(tb_vars,"PrecipitacionCNRMCM5_all_rcp45.csv")

CNRMCM5_rcp45.vars<-data.frame(read.csv("PrecipitacionCNRMCM5_all_rcp45.csv"), MGC="CNRMCM5 RCP 4.5")
names(CNRMCM5_rcp45.vars)
rm(MK_Pvalue,MK_TAU,MK_Z)
#####HADGEM2_ES_####
MK_Pvalue<-raster("data_mk/PrecipitacionHADGEM2_ES_rcp45_MK_P.tif")
names(MK_Pvalue)<-"MK_P"
MK_TAU<-raster("data_mk/PrecipitacionHADGEM2_ES_rcp45_MK_tau.tif")
names(MK_TAU)<-"MK_TAU"
MK_Z<-raster("data_mk/PrecipitacionHADGEM2_ES_rcp45_MK_Z.tif")
names(MK_Z)<-"MK_Z"

rcp45.p<-data.frame(extract(MK_Pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(MK_TAU,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(MK_Z,anp_coor), Variable="z")
names(rcp45.z)[1]<-"Valor"

rcp45<-rbind(rcp45.tau, rcp45.p,rcp45.z)
names(rcp45)
head(rcp45)

base.df<-cbind(rcp45, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(Promedio=mean(Valor), 
                                            var= var(Valor),
                                            Área =unique(Area_km),
                                            Área_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=Promedio-var,
                                     variable_max=Promedio+var,ID_anp=1:length(Promedio)))

write.csv(tb_vars,"PrecipitacionHADGEM2_ES_all_rcp45.csv")

HADGEM2_ES_rcp45.vars<-data.frame(read.csv("PrecipitacionHADGEM2_ES_all_rcp45.csv"), MGC="HADGEM2_ES RCP 4.5")
names(HADGEM2_ES_rcp45.vars)
rm(MK_Pvalue,MK_TAU,MK_Z)
#####MPI_ESM_LR_####
MK_Pvalue<-raster("data_mk/PrecipitacionMPI_ESM_LR_rcp45_MK_P.tif")
names(MK_Pvalue)<-"MK_P"
MK_TAU<-raster("data_mk/PrecipitacionMPI_ESM_LR_rcp45_MK_tau.tif")
names(MK_TAU)<-"MK_TAU"
MK_Z<-raster("data_mk/PrecipitacionMPI_ESM_LR_rcp45_MK_Z.tif")
names(MK_Z)<-"MK_Z"

rcp45.p<-data.frame(extract(MK_Pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(MK_TAU,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(MK_Z,anp_coor), Variable="z")
names(rcp45.z)[1]<-"Valor"

rcp45<-rbind(rcp45.tau, rcp45.p,rcp45.z)
names(rcp45)
head(rcp45)

base.df<-cbind(rcp45, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(Promedio=mean(Valor), 
                                            var= var(Valor),
                                            Área =unique(Area_km),
                                            Área_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=Promedio-var,
                                     variable_max=Promedio+var,ID_anp=1:length(Promedio)))

write.csv(tb_vars,"PrecipitacionMPI_ESM_LR_all_rcp45.csv")
MPI_ESM_LR_rcp45.vars<-data.frame(read.csv("PrecipitacionMPI_ESM_LR_all_rcp45.csv"), MGC="MPI_ESM_LR RCP 4.5")
names(MPI_ESM_LR_rcp45.vars)
rm(MK_Pvalue,MK_TAU,MK_Z)

#####GFDL_CM3_####
MK_Pvalue<-raster("data_mk/PrecipitacionGFDL_CM3_rcp45_MK_P.tif")
names(MK_Pvalue)<-"MK_P"
MK_TAU<-raster("data_mk/PrecipitacionGFDL_CM3_rcp45_MK_tau.tif")
names(MK_TAU)<-"MK_TAU"
MK_Z<-raster("data_mk/PrecipitacionGFDL_CM3_rcp45_MK_Z.tif")
names(MK_Z)<-"MK_Z"

rcp45.p<-data.frame(extract(MK_Pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(MK_TAU,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(MK_Z,anp_coor), Variable="z")
names(rcp45.z)[1]<-"Valor"

rcp45<-rbind(rcp45.tau, rcp45.p,rcp45.z)
names(rcp45)
head(rcp45)

base.df<-cbind(rcp45, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(Promedio=mean(Valor), 
                                            var= var(Valor),
                                            Área =unique(Area_km),
                                            Área_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=Promedio-var,
                                     variable_max=Promedio+var,ID_anp=1:length(Promedio)))

write.csv(tb_vars,"PrecipitacionGFDL_CM3_all_rcp45.csv")
GDFL_CM3_rcp45.vars<-data.frame(read.csv("PrecipitacionGFDL_CM3_all_rcp45.csv"), MGC="GDFL_CM3 RCP 4.5")
names(GDFL_CM3_rcp45.vars)
rm(MK_Pvalue,MK_TAU,MK_Z, rcp45,rcp45.p, rcp45.tau, rcp45.z, tb_vars, base.df)
####bind####
base<-rbind(CNRMCM5_rcp45.vars,GDFL_CM3_rcp45.vars,HADGEM2_ES_rcp45.vars,MPI_ESM_LR_rcp45.vars)
write.csv(base,"Precipitacion_all_rcp45.csv")
