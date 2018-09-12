library(ggplot)
library(ggrepel)
library(stringr)
library(dplyr)
####
#tb_vars %>% purrr::map(~ ggplot(.x, aes(x = area_log, y = Promedio,label =ID_anp )) +
 #                        geom_point(size = 1) +  geom_point(color="#2ca25f")+
  #                       geom_text_repel(aes(label=ID_anp), size = 3)) 
setwd("~/Google Drive File Stream/Mi unidad/MannKendall")
base<-read.csv("pptedio_all_rcp85.csv")
names(base)[2]<-paste("NOMBRE")

PC_1<-subset(base,NOMBRE=="Pantanos de Centla")           #1
LT_1<-subset(base,NOMBRE=="Laguna de Términos")           #2
TC_1<-subset(base,NOMBRE=="Tehuacán-Cuicatlán")           #3
MM_1<-subset(base,NOMBRE=="Mariposa Monarca")             #4
MN_1<-subset(base,NOMBRE=="Manglares de Nichupté")        #5
J_1<-subset(base,NOMBRE=="Janos")                         #6
SSPM_1<-subset(base,NOMBRE=="Sierra de San Pedro Mártir") #7
C1857_1<-subset(base,NOMBRE=="Constitución de 1857")      #9
CS_1<-subset(base,NOMBRE=="Cañón del Sumidero")           #11
SO_1<-subset(base,NOMBRE=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE, "Mapim"))  #10  "Mapim?"

tb_vars<-rbind(PC_1,LT_1,TC_1,MM_1, MN_1, J_1, SSPM_1,C1857_1, CS_1,SO_1, EV_1,CAD_1, M_1)
Pvalue.05<-filter(tb_vars, Pvalue.Promedio <= 0.05)
df0.05_0.7<-filter(Pvalue.05, tau.Promedio >= 0.7)

###tau_area_log####
ggplot(tb_vars, aes(x = tau.Área_log, y = tau.Promedio,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="#08306b")+
  geom_text_repel(aes(label=NOMBRE), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max), color="#08306b")
  #geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))
ggsave("ppt_graficas/Tau_rcp_45.jpg", dpi = 300)

ggplot(Pvalue.05, aes(x = tau.Área_log, y = tau.Promedio,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="#4292c6")+
  geom_text_repel(aes(label=NOMBRE), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max), color="#4292c6")
#geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))
ggsave("ppt_graficas/Pvalue.05_RCP85.jpg", dpi = 300)

ggplot(df0.05_0.7, aes(x = tau.Área_log, y = tau.Promedio,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="#2ca25f")+
  geom_text_repel(aes(label=NOMBRE), size = 3)+
  facet_grid(MGC~.)+ 
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max),color="#2ca25f")
  #geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))

