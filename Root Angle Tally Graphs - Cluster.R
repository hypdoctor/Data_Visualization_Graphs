library(reshape2)
library(ggplot2)

premelt<-read.csv("C:/Users/falk/Google Drive/PhD/PhD Projects/Blue Steel/Paper#2/Root Angles/LRA_Root_Summary.csv", header = T, check.names=FALSE)

colnames(premelt)
ClusterData <- premelt[,c(1,3,9:53)]
colnames(ClusterData)
postmelt <- melt(ClusterData, id.vars = c("Day","Cluster"))


write.csv(postmelt,"C:/Users/falk/Google Drive/PhD/PhD Projects/Blue Steel/Paper#2/Root Angles/Root_Angle_Tally_melted.csv", row.names = F)


Day6_data <- subset(postmelt, postmelt$Day == "6")
Day9_data <- subset(postmelt, postmelt$Day == "9")
Day12_data <- subset(postmelt, postmelt$Day == "12")

tiff("C:/Users/falk/Google Drive/PhD/PhD Projects/Blue Steel/Paper#2/Root Angles/Root_Angle_Tally_melted_Day6.tiff", units = "in" ,height = 8, width = 14, res=200)
ggplot(data=Day6_data, aes(x=Day6_data$variable, y=Day6_data$value)) +
  geom_smooth(data=Day6_data, aes(x=Day6_data$variable,y=Day6_data$value, group=Cluster, color=Cluster), size = 2)  +
  scale_colour_gradientn(colours=rainbow(5)) +
  scale_x_discrete(breaks=seq(0, 90, 10)) +
  ylab("Mean Count") + xlab("Root Angle (0-90 degrees) of 6 Clusters at 6d") + 
  theme_bw() +
  theme(text = element_text(size=12),axis.text.x = element_text(angle = 45, hjust=1), panel.background = element_blank(), panel.grid = element_blank(), strip.background = element_blank(),legend.position="right")
dev.off()

tiff("C:/Users/falk/Google Drive/PhD/PhD Projects/Blue Steel/Paper#2/Root Angles/Root_Angle_Tally_melted_Day9.tiff", units = "in" ,height = 8, width = 14, res=200)
ggplot(data=Day9_data, aes(x=Day9_data$variable, y=Day9_data$value)) +
  geom_smooth(data=Day9_data, aes(x=Day9_data$variable,y=Day9_data$value, group=Cluster, color=Cluster), size = 2)  +
  scale_colour_gradientn(colours=rainbow(5)) +
  scale_x_discrete(breaks=seq(0, 90, 10)) +
  ylab("Mean Count") + xlab("Root Angle (0-90 degrees) of 6 Clusters at 9d") + 
  theme_bw() +
  theme(text = element_text(size=12),axis.text.x = element_text(angle = 45, hjust=1), panel.background = element_blank(), panel.grid = element_blank(), strip.background = element_blank(),legend.position="right")
dev.off()

tiff("C:/Users/falk/Google Drive/PhD/PhD Projects/Blue Steel/Paper#2/Root Angles/Root_Angle_Tally_melted_Day12.tiff", units = "in" ,height = 8, width = 14, res=200)
ggplot(data=Day12_data, aes(x=Day12_data$variable, y=Day12_data$value)) +
  geom_smooth(data=Day12_data, aes(x=Day12_data$variable,y=Day12_data$value, group=Cluster, color=Cluster), size = 2)  +
  scale_colour_gradientn(colours=rainbow(5)) +
  scale_x_discrete(breaks=seq(0, 90, 10)) +
  ylab("Mean Count") + xlab("Root Angle (0-90 degrees) of 6 Clusters at 12d") + 
  theme_bw() +
  theme(text = element_text(size=12),axis.text.x = element_text(angle = 45, hjust=1), panel.background = element_blank(), panel.grid = element_blank(), strip.background = element_blank(),legend.position="right")
dev.off()
