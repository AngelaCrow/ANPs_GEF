library(stringr)

rm(list = ls())

setwd("/Volumes/GoogleDrive/My Drive/ANP_CC")

base<-read.csv("bases/baseclimapais45.csv")

PC_1<-subset(base,NOMBRE=="Pantanos de Centla")           #1
LT_1<-subset(base,NOMBRE=="Laguna de TÃ©rminos")           #2
TC_1<-subset(base,NOMBRE=="TehuacÃ¡n-CuicatlÃ¡n")           #3
MM_1<-subset(base,NOMBRE=="Mariposa Monarca")             #4
MN_1<-subset(base,NOMBRE=="Manglares de NichuptÃ©")        #5
J_1<-subset(base,NOMBRE=="Janos")                         #6  
SSPM_1<-subset(base,NOMBRE=="Sierra de San Pedro MÃ¡rtir") #7
C1857_1<-subset(base,NOMBRE=="ConstituciÃ³n de 1857")      #9
CS_1<-subset(base,NOMBRE=="CaÃ±Ã³n del Sumidero")           #11
SO_1<-subset(base,NOMBRE=="Selva El Ocote")               #12

EV_1<-suset(base, str_detect(base$NOMBRE, "El Viz"))                #13  "El Vizca?no"
CAD_1<-subset(base,str_detect(base$NOMBRE,"C.A.D.N.R. 004 Don Mart"))   #8   "C.A.D.N.R. 004 Don Mart?n"
M_1<-subset(base, str_detect(base$NOMBRE, "Mapim"))  #10  "Mapim?"

write.csv(PC_1, "bases_mes/Centla/centla_mes45.csv", fileEncoding = "UTF-8")
write.csv(LT_1, "bases_mes/Terminos/terminos_mes45.csv",fileEncoding = "UTF-8")
write.csv(TC_1, "bases_mes/Tehuacan/tehuacan_mes45.csv",fileEncoding = "UTF-8")
write.csv(MM_1, "bases_mes/Monarca/monarca_mes45.csv",fileEncoding = "UTF-8")
write.csv(MN_1, "bases_mes/Nichupte/nichupte_mes45.csv",fileEncoding = "UTF-8")
write.csv(J_1, "bases_mes/Janos/janos_mes45.csv", fileEncoding = "UTF-8")
write.csv(SSPM_1, "bases_mes/Martir/ssmartir_mes45.csv", fileEncoding = "UTF-8")
write.csv(C1857_1, "bases_mes/Constitucion/constitucion_mes45.csv", fileEncoding = "UTF-8")
write.csv(CS_1, "bases_mes/Sumidero/sumidero_mes45.csv", fileEncoding = "UTF-8")
write.csv(SO_1, "bases_mes/Ocote/ocote_mes45.csv", fileEncoding = "UTF-8")

write.csv(EV_1, "bases_mes/Vizcaino/vizcaino_mes45.csv", fileEncoding = "UTF-8")
write.csv(CAD_1, "bases_mes/CADNR/CADNR_mes45.csv", fileEncoding = "UTF-8")
write.csv(M_1, "bases_mes/Mapimi/mapimi_mes45.csv", fileEncoding = "UTF-8")


base<-anp_hum

PC_1<-subset(base,NOMBRE=="Pantanos de Centla")           #1
LT_1<-subset(base,NOMBRE=="Laguna de Términos")           #2
TC_1<-subset(base,NOMBRE=="Tehuacán-Cuicatlán")           #3
MM_1<-subset(base,NOMBRE=="Mariposa Monarca")             #4
MN_1<-subset(base,NOMBRE=="Manglares de Nichupté")        #5
J_1<-subset(base,NOMBRE=="Janos")                         #6  
SSPM_1<-subset(base,NOMBRE=="Sierra de San Pedro Mártir") #7
CAD_1<-subset(base,NOMBRE=="C.A.D.N.R. 004 Don Martín")   #8   "C.A.D.N.R. 004 Don Mart?n"
C1857_1<-subset(base,NOMBRE=="Constitución de 1857")      #9
M_1<-subset(base,NOMBRE=="Mapimí")                        #10  "Mapim?"
CS_1<-subset(base,NOMBRE=="Cañón del Sumidero")           #11
SO_1<-subset(base,NOMBRE=="Selva El Ocote")               #12
EV_1<-subset(base,NOMBRE=="El Vizcaíno")                 #13  "El Vizca?no"


dir.create("bases")
write.csv(PC_1, "bases/Centlahumedad45.csv")
write.csv(LT_1, "bases/Terminoshumedad45.csv")
write.csv(TC_1, "bases/Tehuacanhumedad45.csv")
write.csv(MM_1, "bases/Monarcahumedad45.csv")
write.csv(MN_1, "bases/Nichuptehumedad45.csv")
write.csv(J_1, "bases/Janoshumedad45.csv")
write.csv(SSPM_1, "bases/Martirhumedad45.csv")
write.csv(C1857_1, "bases/Constitucionhumedad45.csv")
write.csv(CS_1, "bases/Sumiderohumedad45.csv")
write.csv(SO_1, "bases/Ocote/ocote_mes45.csv")
write.csv(EV_1, "bases/Vizcainohumedad45.csv")
write.csv(CAD_1, "bases/CADNRhumedad45.csv")
write.csv(M_1, "bases/Mapimihumedad45.csv")


rm(PC_1, LT_1, TC_1, MM_1, MN_1, J_1,
   SSPM_1,CAD_1,C1857_1,M_1,CS_1,SO_1,EV_1)

write.csv(PC_1, "bases/Centla/CNRMCM5_rcp45centla_anual.csv")
write.csv(LT_1, "bases/Terminos/CNRMCM5_rcp45terminos_anual.csv")
write.csv(TC_1, "bases/Tehuacan/CNRMCM5_rcp45tehuacan_anual.csv")
write.csv(MM_1, "bases/Monarca/CNRMCM5_rcp45monarca_anual.csv")
write.csv(MN_1, "bases/Nichupte/CNRMCM5_rcp45nichupte_anual.csv")
write.csv(J_1, "bases/Janos/CNRMCM5_rcp45janos_anual.csv")
write.csv(SSPM_1, "bases/Martir/CNRMCM5_rcp45ssmartir_anual.csv")
write.csv(CAD_1, "bases/CADNR/CNRMCM5_rcp45CADNR_anual.csv")
write.csv(C1857_1, "bases/Constitucion/CNRMCM5_rcp45constitucion_anual.csv")
write.csv(M_1, "bases/Mapimi/CNRMCM5_rcp45mapimi_anual.csv")
write.csv(CS_1, "bases/Sumidero/CNRMCM5_rcp45sumidero_anual.csv")
write.csv(SO_1, "bases/Ocote/CNRMCM5_rcp45ocote_anual.csv")
write.csv(EV_1, "bases/Vizcaino/CNRMCM5_rcp45vizcaino_anual.csv")