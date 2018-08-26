library(raster)
library(purrr)
library(dplyr)
library(ggplot2)
library(ggrepel)

anps_todas<-read.csv("anps_fed_terrestres2018.csv")
names(anps_todas)

anp_coor <- anps_todas[c("POINT_X", "POINT_Y")]

bio01_futuro<-raster("~/Google Drive File Stream/Mi unidad/2_WEGP_CONABIO/Bios/CNRMCM5_rcp85_2075-2099_bio/CNRMCM5_75_bio1.tif")
bio01_presente<-raster("~/Google Drive File Stream/Mi unidad/2_WEGP_CONABIO/Bios/Bios(1980-2009)_tiff_g/p3bio01.tif")
deltabio01<-bio01_futuro-bio01_presente
dbio01<-data.frame(extract(deltabio01,anp_coor), Variable="Bio01_CNRMCM5_rcp85")
names(dbio01)[1]<-"Valor"

bio12_futuro<-raster("~/Google Drive File Stream/Mi unidad/2_WEGP_CONABIO/Bios/CNRMCM5_rcp85_2075-2099_bio/CNRMCM5_75_bio12.tif")
bio12_presente<-raster("~/Google Drive File Stream/Mi unidad/2_WEGP_CONABIO/Bios/Bios(1980-2009)_tiff_g/p3bio12.tif")
deltabio12<-bio12_futuro-bio12_presente
dbio12<-data.frame(extract(deltabio12,anp_coor), Variable="Bio12_CNRMCM5_rcp85")
names(dbio12)[1]<-"Valor"

#####CNRMCM5_####
MK_pvalue<-raster("TMinimaCNRMCM5_rcp85_MK_P.tif")
names(MK_pvalue)<-"MK_p"
MK_tau<-raster("TMinimaCNRMCM5_rcp85_MK_tau.tif")
names(MK_tau)<-"MK_tau"
MK_z<-raster("TMinimaCNRMCM5_rcp85_MK_Z.tif")
names(MK_z)<-"Mk_z"

rcp85.p<-data.frame(extract(MK_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(MK_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(MK_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(Valor), 
                                                var= var(Valor),
                                                area =unique(Area_km),
                                                area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"TMinimaCNRMCM5_all_rcp85.csv")

CNRMCM5_rcp85.vars<-data.frame(read.csv("TMinimaCNRMCM5_all_rcp85.csv"), MGC="CNRMCM5_rcp85")
names(CNRMCM5_rcp85.vars)

#####HADGEM2_ES_####
MK_pvalue<-raster("TMinimaHADGEM2_ES_rcp85_MK_P.tif")
names(MK_pvalue)<-"MK_p"
MK_tau<-raster("TMinimaHADGEM2_ES_rcp85_MK_tau.tif")
names(MK_tau)<-"MK_tau"
MK_z<-raster("TMinimaHADGEM2_ES_rcp85_MK_Z.tif")
names(MK_z)<-"Mk_z"

rcp85.p<-data.frame(extract(MK_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(MK_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(MK_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(Valor), 
                                            var= var(Valor),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"TMinimaHADGEM2_ES_all_rcp85.csv")

HADGEM2_ES_rcp85.vars<-data.frame(read.csv("TMinimaHADGEM2_ES_all_rcp85.csv"), MGC="HADGEM2_ES_rcp85")
names(HADGEM2_ES_rcp85.vars)

#####MPI_ESM_LR_####
MK_pvalue<-raster("TMinimaMPI_ESM_LR_rcp85_MK_P.tif")
names(MK_pvalue)<-"MK_p"
MK_tau<-raster("TMinimaMPI_ESM_LR_rcp85_MK_tau.tif")
names(MK_tau)<-"MK_tau"
MK_z<-raster("TMinimaMPI_ESM_LR_rcp85_MK_Z.tif")
names(MK_z)<-"Mk_z"

rcp85.p<-data.frame(extract(MK_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(MK_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(MK_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(Valor), 
                                            var= var(Valor),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"TMinimaMPI_ESM_LR_all_rcp85.csv")
MPI_ESM_LR_rcp85.vars<-data.frame(read.csv("TMinimaMPI_ESM_LR_all_rcp85.csv"), MGC="MPI_ESM_LR_rcp85")
names(MPI_ESM_LR_rcp85.vars)

#####GFDL_CM3_####
MK_pvalue<-raster("TMinimaGFDL_CM3_rcp85_MK_P.tif")
names(MK_pvalue)<-"MK_p"
MK_tau<-raster("TMinimaGFDL_CM3_rcp85_MK_tau.tif")
names(MK_tau)<-"MK_tau"
MK_z<-raster("TMinimaGFDL_CM3_rcp85_MK_Z.tif")
names(MK_z)<-"Mk_z"

rcp85.p<-data.frame(extract(MK_pvalue,anp_coor), Variable="Pvalue")
names(rcp85.p)[1]<-"Valor"
rcp85.tau<-data.frame(extract(MK_tau,anp_coor), Variable="tau")
names(rcp85.tau)[1]<-"Valor"
rcp85.z<-data.frame(extract(MK_z,anp_coor), Variable="z")
names(rcp85.z)[1]<-"Valor"

rcp85<-rbind(rcp85.tau, rcp85.p,rcp85.z)
names(rcp85)
head(rcp85)

base.df<-cbind(rcp85, anps_todas)
head(base.df)

tb_vars <- base.df %>% split(.$Variable) %>%  
  map(~ group_by(.x,.$NOMBRE) %>% summarise(mu=mean(Valor), 
                                            var= var(Valor),
                                            area =unique(Area_km),
                                            area_log = log(unique(Area_km)))) %>%
  map(~na.omit(.x)) %>% map(~ mutate(.x,variable_min=mu-var,
                                     variable_max=mu+var,ID_anp=1:length(mu)))

write.csv(tb_vars,"TMinimaGFDL_CM3_all_rcp85.csv")
GFDL_CM3_rcp85.vars<-data.frame(read.csv("TMinimaGFDL_CM3_all_rcp85.csv"), MGC="GFDL_CM3_rcp85")
names(GFDL_CM3_rcp85.vars)

####bind####
tb_vars<-rbind(CNRMCM5_rcp85.vars,GFDL_CM3_rcp85.vars,HADGEM2_ES_rcp85.vars,MPI_ESM_LR_rcp85.vars)
write.csv(tb_vars,"TMinima_all_rcp85.csv")

