library(ggplot)
library(ggrepel)
library(stringr)
library(dplyr)
####
#tb_vars %>% purrr::map(~ ggplot(.x, aes(x = area_log, y = mu,label =ID_anp )) +
 #                        geom_point(size = 1) +  geom_point(color="purple")+
  #                       geom_text_repel(aes(label=ID_anp), size = 3)) 
setwd("")
base<-read.csv("~/Google Drive File Stream/Mi unidad/MannKendall/TMinima_all_rcp85.csv")
names(base)[3]<-paste("NOMBRE")

PC_1<-subset(base,NOMBRE=="Pantanos de Centla")           #1
LT_1<-subset(base,NOMBRE=="Laguna de Términos")           #2
TC_1<-subset(base,NOMBRE=="Tehuacán-Cuicatlán")           #3
MM_1<-subset(base,NOMBRE=="Mariposa Monarca")             #4
MN_1<-subset(base,NOMBRE=="Manglares de Nichupté")        #5
J_1<-subset(base,NOMBRE=="Janos")                         #6
SSPM_1<-subset(base,NOMBRE=="Sierra de San Pedro Mártir") #7
C1857_1<-subset(base,NOMBRE=="Constitución de 1857")      #9
CS_1<-subset(base,NOMBRE=="Cañon del Sumidero")           #11
SO_1<-subset(base,NOMBRE=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE, "Mapim"))  #10  "Mapim?"

tb_vars<-rbind(PC_1,LT_1,TC_1,MM_1, MN_1, J_1, SSPM_1,C1857_1, CS_1,SO_1, EV_1,CAD_1, M_1)
Pvalue.05<-filter(tb_vars, Pvalue.mu <= 0.05)
df0.05_0.7<-filter(Pvalue.05, tau.mu >= 0.8)

###tau_area_log####
ggplot(tb_vars, aes(x = tau.area_log, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max), color="purple")
  #geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))
ggsave("tmin_graficas/tb_vars.jpg", dpi = 300)

ggplot(Pvalue.05, aes(x = tau.area_log, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max), color="purple")
#geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))
ggsave("tmin_graficas/Pvalue.05_RCP85.jpg", dpi = 300)

ggplot(df0.05_0.7, aes(x = tau.area_log, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.)+ 
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max),color="purple")
  #geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))

###tau_pvalue####
ggplot(tb_vars, aes(x = Pvalue.mu, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  #geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max))+
  geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))

ggplot(df0.05_0.7, aes(x = Pvalue.mu, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  #geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.)+ 
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max))+
  geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))






