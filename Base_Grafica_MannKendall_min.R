library(raster)
library(purrr)
library(dplyr)
library(ggplot2)
library(ggrepel)

anps_todas<-read.csv("anps_fed_terrestres2018.csv")
names(anps_todas)

anp_coor <- anps_todas[c("POINT_X", "POINT_Y")]

#####CNRMCM5_####
mk_pvalue<-raster("data_mk/tminimacnrmcm5_rcp45_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimacnrmcm5_rcp45_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimacnrmcm5_rcp45_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp45.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
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

write.csv(tb_vars,"tminimacnrmcm5_all_rcp45.csv")

CNRMCM5_rcp45.vars<-data.frame(read.csv("tminimacnrmcm5_all_rcp45.csv"), MGC="CNRMCM5 RCP 4.5")
names(CNRMCM5_rcp45.vars)

#####hadgem2_es_####
mk_pvalue<-raster("data_mk/tminimahadgem2_es_rcp45_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimahadgem2_es_rcp45_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimahadgem2_es_rcp45_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp45.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
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

write.csv(tb_vars,"tminimahadgem2_es_all_rcp45.csv")

HADGEM2_es_rcp45.vars<-data.frame(read.csv("tminimahadgem2_es_all_rcp45.csv"), MGC="HADGEM2_ES RCP 4.5")
names(HADGEM2_es_rcp45.vars)

#####mpi_esm_lr_####
mk_pvalue<-raster("data_mk/tminimampi_esm_lr_rcp45_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimampi_esm_lr_rcp45_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimampi_esm_lr_rcp45_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp45.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
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

write.csv(tb_vars,"tminimampi_esm_lr_all_rcp45.csv")
MPI_ESM_LR_rcp45.vars<-data.frame(read.csv("tminimampi_esm_lr_all_rcp45.csv"), MGC="MPI_ESM_LR RCP 4.5")
names(MPI_ESM_LR_rcp45.vars)

#####gfdl_cm3_####
mk_pvalue<-raster("data_mk/tminimagfdl_cm3_rcp45_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimagfdl_cm3_rcp45_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimagfdl_cm3_rcp45_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp45.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp45.p)[1]<-"Valor"
rcp45.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp45.tau)[1]<-"Valor"
rcp45.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
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

write.csv(tb_vars,"tminimagfdl_cm3_all_rcp45.csv")
GDFL_CM3_rcp45.vars<-data.frame(read.csv("tminimagfdl_cm3_all_rcp45.csv"), MGC="GDFL_CM3 RCP 4.5")
names(GDFL_CM3_rcp45.vars)

####bind####
base<-rbind(CNRMCM5_rcp45.vars,GDFL_CM3_rcp45.vars,HADGEM2_es_rcp45.vars,MPI_ESM_LR_rcp45.vars)
write.csv(base,"tminima_all_rcp45.csv")