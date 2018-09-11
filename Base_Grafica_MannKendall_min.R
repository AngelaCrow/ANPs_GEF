library(raster)
library(purrr)
library(dplyr)
library(ggplot2)
library(ggrepel)

anps_todas<-read.csv("anps_fed_terrestres2018.csv")
names(anps_todas)

anp_coor <- anps_todas[c("POINT_X", "POINT_Y")]

#####CNRMCM5_####
mk_pvalue<-raster("data_mk/tminimacnrmcm5_rcp85_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimacnrmcm5_rcp85_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimacnrmcm5_rcp85_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp85.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(complete.cases(Valor)), 
                                                var= var(complete.cases(Valor)),
                                                area =unique(Area_km),
                                                area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"tminimacnrmcm5_all_rcp85.csv")

CNRMCM5_rcp85.vars<-data.frame(read.csv("tminimacnrmcm5_all_rcp85.csv"), MGC="CNRMCM5_rcp85")
names(CNRMCM5_rcp85.vars)

#####hadgem2_es_####
mk_pvalue<-raster("data_mk/tminimahadgem2_es_rcp85_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimahadgem2_es_rcp85_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimahadgem2_es_rcp85_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp85.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(complete.cases(Valor)), 
                                            var= var(complete.cases(Valor)),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"tminimahadgem2_es_all_rcp85.csv")

hadgem2_es_rcp85.vars<-data.frame(read.csv("tminimahadgem2_es_all_rcp85.csv"), MGC="HADGEM2_es_rcp85")
names(hadgem2_es_rcp85.vars)

#####mpi_esm_lr_####
mk_pvalue<-raster("data_mk/tminimampi_esm_lr_rcp85_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimampi_esm_lr_rcp85_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimampi_esm_lr_rcp85_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp85.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(complete.cases(Valor)), 
                                            var= var(complete.cases(Valor)),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"tminimampi_esm_lr_all_rcp85.csv")
mpi_esm_lr_rcp85.vars<-data.frame(read.csv("tminimampi_esm_lr_all_rcp85.csv"), MGC="MPI_ESM_LR_rcp85")
names(mpi_esm_lr_rcp85.vars)

#####gfdl_cm3_####
mk_pvalue<-raster("data_mk/tminimagfdl_cm3_rcp85_mk_p.tif")
names(mk_pvalue)<-"mk_p"
mk_tau<-raster("data_mk/tminimagfdl_cm3_rcp85_mk_tau.tif")
names(mk_tau)<-"mk_tau"
mk_z<-raster("data_mk/tminimagfdl_cm3_rcp85_mk_Z.tif")
names(mk_z)<-"mk_z"

rcp85.p<-data.frame(extract(mk_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(mk_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(mk_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(complete.cases(Valor)), 
                                            var= var(complete.cases(Valor)),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"tminimagfdl_cm3_all_rcp85.csv")
gfdl_cm3_rcp85.vars<-data.frame(read.csv("tminimagfdl_cm3_all_rcp85.csv"), MGC="GDFL_CM3_rcp85")
names(gfdl_cm3_rcp85.vars)

####bind####
tb_vars<-rbind(CNRMCM5_rcp85.vars,gfdl_cm3_rcp85.vars,hadgem2_es_rcp85.vars,mpi_esm_lr_rcp85.vars)
write.csv(tb_vars,"tminima_all_rcp85.csv")

