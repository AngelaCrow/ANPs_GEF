library(ggplot2)
library(stringr)
library(raster)

anps_todas<-read.csv("anps_fed_terrestres2018.csv")
names(anps_todas)
anp_coor <- anps_todas[c("POINT_X", "POINT_Y")]

#
MK_pvalue<-raster("TMaximaCNRMCM5_rcp85_MK_tau.tif")
names(MK_pvalue)<-"MK_p"
Mk_p.df.CNRMCM5<-data.frame(extract(MK_pvalue,anp_coor), MGC="CNRMCM5_rcp85")
names(Mk_p.df.CNRMCM5)[1]<-"Tendencia"
Mk_CNRMCM5<-cbind(Mk_p.df.CNRMCM5,anps_todas)
rm(MK_pvalue)

MK_pvalue<-raster("TMaximaGFDL_CM3_rcp85_MK_tau.tif")
names(MK_pvalue)<-"MK_p"
Mk_p.df.GFDL_CM3<-data.frame(extract(MK_pvalue,anp_coor), MGC="GFDL_CM3_rcp85")
names(Mk_p.df.GFDL_CM3)[1]<-"Tendencia"
Mk_GFDL_CM3<-cbind(Mk_p.df.GFDL_CM3,anps_todas)
rm(MK_pvalue)

MK_pvalue<-raster("TMaximaHADGEM2_ES_rcp85_MK_tau.tif")
names(MK_pvalue)<-"MK_p"
Mk_p.df.HADGEM2_ES<-data.frame(extract(MK_pvalue,anp_coor), MGC="HADGEM2_ES_rcp85")
names(Mk_p.df.HADGEM2_ES)[1]<-"Tendencia"
Mk_HADGEM2_ES<-cbind(Mk_p.df.HADGEM2_ES,anps_todas)
rm(MK_pvalue)

MK_pvalue<-raster("TMaximaMPI_ESM_LR_rcp85_MK_tau.tif")
names(MK_pvalue)<-"MK_p"
Mk_p.df.MPI_ESM_LR<-data.frame(extract(MK_pvalue,anp_coor), MGC="MPI_ESM_LR_rcp85")
names(Mk_p.df.MPI_ESM_LR)[1]<-"Tendencia"
Mk_MPI_ESM_LR<-cbind(Mk_p.df.MPI_ESM_LR,anps_todas)
rm(MK_pvalue)

base<-rbind(Mk_CNRMCM5,Mk_GFDL_CM3, Mk_HADGEM2_ES,Mk_MPI_ESM_LR)

PC_rcp85<-subset(base,NOMBRE=="Pantanos de Centla")           #1
LT_rcp85<-subset(base,NOMBRE=="Laguna de Términos")           #2
TC_rcp85<-subset(base,NOMBRE=="Tehuacán-Cuicatlán")           #3
MM_rcp85<-subset(base,NOMBRE=="Mariposa Monarca")             #4
MN_rcp85<-subset(base,NOMBRE=="Manglares de Nichupté")        #5
J_rcp85<-subset(base,NOMBRE=="Janos")                         #6  
SSPM_rcp85<-subset(base,NOMBRE=="Sierra de San Pedro Mártir") #7
C1857_rcp85<-subset(base,NOMBRE=="Constitución de 1857")      #9
CS_rcp85<-subset(base,str_detect(base$NOMBRE,"Sumidero"))     #11
SO_rcp85<-subset(base,NOMBRE=="Selva El Ocote")               #12
EV_rcp85<-subset(base, str_detect(base$NOMBRE, "El Viz"))     #13 
CAD_rcp85<-subset(base,str_detect(base$NOMBRE,"C.A.D.N.R. 004 Don Mart"))   #8
M_rcp85<-subset(base, str_detect(base$NOMBRE, "Mapim"))  #10 

ggplot(PC_rcp85) +
  geom_histogram(aes(x=Tendencia, fill=MGC), bins = 40, 
                 colour="grey50", alpha=0.5, position="identity")+
  facet_grid(MGC~.)

ggsave("tmax_graficas/PC_rcp85.jpg", dpi = 300)

