library(stringr)

rm(list = ls())

#setwd("/Volumes/GoogleDrive/My Drive/ANP_CC")

#Mensual####
#rcp45
base<-read.csv("bases/GFDL_CM3_rcp45anp_mes_g.csv")

PC_1<-subset(base,NOMBRE_FIN=="Pantanos de Centla")           #1
LT_1<-subset(base, str_detect(base$NOMBRE_FIN, "Laguna de T")) 
TC_1<-subset(base, str_detect(base$NOMBRE_FIN, "Tehuac"))
MM_1<-subset(base,NOMBRE_FIN=="Mariposa Monarca")             #4
MN_1<-subset(base, str_detect(base$NOMBRE_FIN, "Manglares de Nichu"))
J_1<-subset(base,NOMBRE_FIN=="Janos")                         #6  
SSPM_1<-subset(base, str_detect(base$NOMBRE_FIN, "Sierra de San Pedro M"))
C1457_1<-subset(base, str_detect(base$NOMBRE_FIN, "Constituci"))
CS_1<-subset(base, str_detect(base$NOMBRE_FIN, "del Sumidero"))
SO_1<-subset(base,NOMBRE_FIN=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE_FIN, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE_FIN,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE_FIN, "Mapim"))  #10  "Mapim?"

write.csv(PC_1, "bases/Centla/GFDL_CM3/centla_mes45.csv", fileEncoding = "UTF-8")
write.csv(LT_1, "bases/Terminos/GFDL_CM3/terminos_mes45.csv",fileEncoding = "UTF-8")
write.csv(TC_1, "bases/Tehuacan/GFDL_CM3/tehuacan_mes45.csv",fileEncoding = "UTF-8")
write.csv(MM_1, "bases/Monarca/GFDL_CM3/monarca_mes45.csv",fileEncoding = "UTF-8")
write.csv(MN_1, "bases/Nichupte/GFDL_CM3/nichupte_mes45.csv",fileEncoding = "UTF-8")
write.csv(J_1, "bases/Janos/GFDL_CM3/janos_mes45.csv", fileEncoding = "UTF-8")
write.csv(SSPM_1, "bases/Martir/GFDL_CM3/martir_mes45.csv", fileEncoding = "UTF-8")
write.csv(C1457_1, "bases/Constitucion/GFDL_CM3/constitucion_mes45.csv", fileEncoding = "UTF-8")
write.csv(CS_1, "bases/Sumidero/GFDL_CM3/sumidero_mes45.csv", fileEncoding = "UTF-8")
write.csv(SO_1, "bases/Ocote/GFDL_CM3/ocote_mes45.csv", fileEncoding = "UTF-8")
write.csv(EV_1, "bases/Vizcaino/GFDL_CM3/vizcaino_mes45.csv", fileEncoding = "UTF-8")
write.csv(CAD_1, "bases/CADNR/GFDL_CM3/CADNR_mes45.csv", fileEncoding = "UTF-8")
write.csv(M_1, "bases/Mapimi/GFDL_CM3/mapimi_mes45.csv", fileEncoding = "UTF-8")

rm(list = ls())

##rcp85
base<-read.csv("bases/GFDL_CM3_rcp85anp_mes_g.csv")

PC_1<-subset(base,NOMBRE_FIN=="Pantanos de Centla")           #1
LT_1<-subset(base, str_detect(base$NOMBRE_FIN, "Laguna de T")) 
TC_1<-subset(base, str_detect(base$NOMBRE_FIN, "Tehuac"))
MM_1<-subset(base,NOMBRE_FIN=="Mariposa Monarca")             #4
MN_1<-subset(base, str_detect(base$NOMBRE_FIN, "Manglares de Nichu"))
J_1<-subset(base,NOMBRE_FIN=="Janos")                         #6  
SSPM_1<-subset(base, str_detect(base$NOMBRE_FIN, "Sierra de San Pedro M"))
C1857_1<-subset(base, str_detect(base$NOMBRE_FIN, "Constituci"))
CS_1<-subset(base, str_detect(base$NOMBRE_FIN, "del Sumidero"))
SO_1<-subset(base,NOMBRE_FIN=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE_FIN, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE_FIN,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE_FIN, "Mapim"))  #10  "Mapim?"

write.csv(PC_1, "bases/Centla/GFDL_CM3/centla_mes85.csv", fileEncoding = "UTF-8")
write.csv(LT_1, "bases/Terminos/GFDL_CM3/terminos_mes85.csv",fileEncoding = "UTF-8")
write.csv(TC_1, "bases/Tehuacan/GFDL_CM3/tehuacan_mes85.csv",fileEncoding = "UTF-8")
write.csv(MM_1, "bases/Monarca/GFDL_CM3/monarca_mes85.csv",fileEncoding = "UTF-8")
write.csv(MN_1, "bases/Nichupte/GFDL_CM3/nichupte_mes85.csv",fileEncoding = "UTF-8")
write.csv(J_1, "bases/Janos/GFDL_CM3/janos_mes85.csv", fileEncoding = "UTF-8")
write.csv(SSPM_1, "bases/Martir/GFDL_CM3/martir_mes85.csv", fileEncoding = "UTF-8")
write.csv(C1857_1, "bases/Constitucion/GFDL_CM3/constitucion_mes85.csv", fileEncoding = "UTF-8")
write.csv(CS_1, "bases/Sumidero/GFDL_CM3/sumidero_mes85.csv", fileEncoding = "UTF-8")
write.csv(SO_1, "bases/Ocote/GFDL_CM3/ocote_mes85.csv", fileEncoding = "UTF-8")
write.csv(EV_1, "bases/Vizcaino/GFDL_CM3/vizcaino_mes85.csv", fileEncoding = "UTF-8")
write.csv(CAD_1, "bases/CADNR/GFDL_CM3/CADNR_mes85.csv", fileEncoding = "UTF-8")
write.csv(M_1, "bases/Mapimi/GFDL_CM3/mapimi_mes85.csv", fileEncoding = "UTF-8")

rm(list = ls())

#Anual####
#rcp45
base<-read.csv("bases/GFDL_CM3_rcp45anp_anual_g.csv")

PC_1<-subset(base,NOMBRE_FIN=="Pantanos de Centla")           #1
LT_1<-subset(base, str_detect(base$NOMBRE_FIN, "Laguna de T")) 
TC_1<-subset(base, str_detect(base$NOMBRE_FIN, "Tehuac"))
MM_1<-subset(base,NOMBRE_FIN=="Mariposa Monarca")             #4
MN_1<-subset(base, str_detect(base$NOMBRE_FIN, "Manglares de Nichu"))
J_1<-subset(base,NOMBRE_FIN=="Janos")                         #6  
SSPM_1<-subset(base, str_detect(base$NOMBRE_FIN, "Sierra de San Pedro M"))
C1457_1<-subset(base, str_detect(base$NOMBRE_FIN, "Constituci"))
CS_1<-subset(base, str_detect(base$NOMBRE_FIN, "del Sumidero"))
SO_1<-subset(base,NOMBRE_FIN=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE_FIN, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE_FIN,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE_FIN, "Mapim"))  #10  "Mapim?"

write.csv(PC_1, "bases/Centla/GFDL_CM3/centla_anual45.csv", fileEncoding = "UTF-8")
write.csv(LT_1, "bases/Terminos/GFDL_CM3/terminos_anual45.csv",fileEncoding = "UTF-8")
write.csv(TC_1, "bases/Tehuacan/GFDL_CM3/tehuacan_anual45.csv",fileEncoding = "UTF-8")
write.csv(MM_1, "bases/Monarca/GFDL_CM3/monarca_anual45.csv",fileEncoding = "UTF-8")
write.csv(MN_1, "bases/Nichupte/GFDL_CM3/nichupte_anual45.csv",fileEncoding = "UTF-8")
write.csv(J_1, "bases/Janos/GFDL_CM3/janos_anual45.csv", fileEncoding = "UTF-8")
write.csv(SSPM_1, "bases/Martir/GFDL_CM3/martir_anual45.csv", fileEncoding = "UTF-8")
write.csv(C1457_1, "bases/Constitucion/GFDL_CM3/constitucion_anual45.csv", fileEncoding = "UTF-8")
write.csv(CS_1, "bases/Sumidero/GFDL_CM3/sumidero_anual45.csv", fileEncoding = "UTF-8")
write.csv(SO_1, "bases/Ocote/GFDL_CM3/ocote_anual45.csv", fileEncoding = "UTF-8")
write.csv(EV_1, "bases/Vizcaino/GFDL_CM3/vizcaino_anual45.csv", fileEncoding = "UTF-8")
write.csv(CAD_1, "bases/CADNR/GFDL_CM3/CADNR_anual45.csv", fileEncoding = "UTF-8")
write.csv(M_1, "bases/Mapimi/GFDL_CM3/mapimi_anual45.csv", fileEncoding = "UTF-8")

rm(list = ls())

##rcp85
base<-read.csv("bases/GFDL_CM3_rcp85anp_anual_g.csv")

PC_1<-subset(base,NOMBRE_FIN=="Pantanos de Centla")           #1
LT_1<-subset(base, str_detect(base$NOMBRE_FIN, "Laguna de T")) 
TC_1<-subset(base, str_detect(base$NOMBRE_FIN, "Tehuac"))
MM_1<-subset(base,NOMBRE_FIN=="Mariposa Monarca")             #4
MN_1<-subset(base, str_detect(base$NOMBRE_FIN, "Manglares de Nichu"))
J_1<-subset(base,NOMBRE_FIN=="Janos")                         #6  
SSPM_1<-subset(base, str_detect(base$NOMBRE_FIN, "Sierra de San Pedro M"))
C1857_1<-subset(base, str_detect(base$NOMBRE_FIN, "Constituci"))
CS_1<-subset(base, str_detect(base$NOMBRE_FIN, "del Sumidero"))
SO_1<-subset(base,NOMBRE_FIN=="Selva El Ocote")               #12
EV_1<-subset(base, str_detect(base$NOMBRE_FIN, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE_FIN,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE_FIN, "Mapim"))  #10  "Mapim?"

write.csv(PC_1, "bases/Centla/GFDL_CM3/centla_anual85.csv", fileEncoding = "UTF-8")
write.csv(LT_1, "bases/Terminos/GFDL_CM3/terminos_anual85.csv",fileEncoding = "UTF-8")
write.csv(TC_1, "bases/Tehuacan/GFDL_CM3/tehuacan_anual85.csv",fileEncoding = "UTF-8")
write.csv(MM_1, "bases/Monarca/GFDL_CM3/monarca_anual85.csv",fileEncoding = "UTF-8")
write.csv(MN_1, "bases/Nichupte/GFDL_CM3/nichupte_anual85.csv",fileEncoding = "UTF-8")
write.csv(J_1, "bases/Janos/GFDL_CM3/janos_anual85.csv", fileEncoding = "UTF-8")
write.csv(SSPM_1, "bases/Martir/GFDL_CM3/martir_anual85.csv", fileEncoding = "UTF-8")
write.csv(C1857_1, "bases/Constitucion/GFDL_CM3/constitucion_anual85.csv", fileEncoding = "UTF-8")
write.csv(CS_1, "bases/Sumidero/GFDL_CM3/sumidero_anual85.csv", fileEncoding = "UTF-8")
write.csv(SO_1, "bases/Ocote/GFDL_CM3/ocote_anual85.csv", fileEncoding = "UTF-8")
write.csv(EV_1, "bases/Vizcaino/GFDL_CM3/vizcaino_anual85.csv", fileEncoding = "UTF-8")
write.csv(CAD_1, "bases/CADNR/GFDL_CM3/CADNR_anual85.csv", fileEncoding = "UTF-8")
write.csv(M_1, "bases/Mapimi/GFDL_CM3/mapimi_anual85.csv", fileEncoding = "UTF-8")

rm(list = ls())


