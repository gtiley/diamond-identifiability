library(dplyr)
library (tidyr)

setwd("~/branch/badDiamond/")

simres <- read.table("All-Simulation-Results.txt",header=TRUE,sep="\t")
simres.agg <- simres %>% group_by(Methods,Root,Root.Error,NNI.Error,Diamond,nTrees,best_h) %>% summarise(total_count=n(),.groups='drop')
simres.agg.df <- as.data.frame(simres.agg)
simres.agg.df.wideh <- spread(simres.agg.df,best_h,total_count)
write.table(simres.agg.df.wideh,"simulations-hcounts.txt",quote=FALSE,sep="\t",row.names=FALSE)


#For the diamonds - had to print out an intermediate file because "0" in the header was causing problems as a data frame

simres.agg <- simres %>% group_by(Methods,Root,Root.Error,NNI.Error,Diamond,nTrees,RF_dist) %>% summarise(total_count=n(),.groups='drop')
simres.agg.df <- as.data.frame(simres.agg)
simres.agg.df.wideh <- spread(simres.agg.df,RF_dist,total_count)
simres.agg.df.wideh.new <- simres.agg.df.wideh[, colnames(simres.agg.df.wideh)[c(1:7)]]
write.table(simres.agg.df.wideh.new, file="simulations-percentcorrect.txt",sep="\t",row.names=FALSE,quote=FALSE)

#Have to manually change 0 to Percent_Correct

percentcorrect <- read.table("simulations-percentcorrect.txt",header=TRUE,sep="\t")
percentcorrect$Percent_Correct <- percentcorrect$Percent_Correct/100
percentcorrect.wide <- spread(percentcorrect,Diamond,Percent_Correct)
write.table(percentcorrect.wide, file="simulations-percentcorrect.txt-bydiamond",sep="\t",row.names=FALSE,quote=FALSE)
