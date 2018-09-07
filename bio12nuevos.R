prec4<-stack(Sys.glob("E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_prec/*p4prec*.tif"))
names(prec4)
prec4_CNRMCM_rcp85<-sum(prec4)
writeRaster(prec4_CNRMCM_rcp85, "E:/UniAtmos_P3/UniAtmosAngela/CNRMCM5_rcp85_2015-2039_bio/bio12nuevo.tif" )
plot(prec4_CNRMCM_rcp85)
rm(prec4)v

