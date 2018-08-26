####
#tb_vars %>% purrr::map(~ ggplot(.x, aes(x = area_log, y = mu,label =ID_anp )) +
 #                        geom_point(size = 1) +  geom_point(color="purple")+
  #                       geom_text_repel(aes(label=ID_anp), size = 3)) 
setwd("")
tb_vars<-read.csv("~/Google Drive File Stream/My Drive/MannKendall/TMinima_all_rcp85.csv")
Pvalue.05<-filter(tb_vars, Pvalue.mu <= 0.05)
df0.05_0.7<-filter(Pvalue.05, tau.mu >= 0.7)

###tau_area_log####
ggplot(tb_vars, aes(x = tau.area_log, y = tau.mu,label =z.ID_anp )) +
  geom_point(size = 1) +  geom_point(color="purple")+
  geom_text_repel(aes(label=z.ID_anp), size = 3)+
  facet_grid(MGC~.) +
  geom_errorbar(aes(ymin = tau.variable_min, ymax = tau.variable_max), color="purple")
  #geom_errorbarh(aes(xmax = Pvalue.variable_max, xmin = Pvalue.variable_min))

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






