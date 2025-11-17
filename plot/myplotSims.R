library(tidyverse)
library(gridExtra)
library(grid)
library(gtable)

# setwd("~/branch/badDiamond/res2/")

# Create user-defined function, which extracts legends from ggplots
extract_legend <- function(my_ggp) {
  step1 <- ggplot_gtable(ggplot_build(my_ggp))
  step2 <- which(sapply(step1$grobs, function(x) x$name) == "guide-box")
  step3 <- step1$grobs[[step2]]
  return(step3)
}

####################### phi1 true #############################
data1 <- read.table("0.5.True.resultForPlotting.txt", sep = "\t",header=TRUE)
p1 <- ggplot(data1, aes(x=xPos,y=FoundOneEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("One Edge Detected",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5)) + 
  ggtitle(expression(paste("gamma=0.5", sep="")))
p2 <- ggplot(data1, aes(x=xPos,y=CorrectNetwork/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))
p3 <- ggplot(data1, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_text(size=8), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))

plegend <- ggplot(data1, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees))) + 
  geom_point(size=3) +
  scale_shape_manual(name="nTrees", labels=c("250","1000","4000"), values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"),limits=c(-0.1,1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(),axis.text = element_text(size = 8), axis.title = element_text(size = 10), legend.position = "bottom", axis.text.x = element_text(angle = 0), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"))
# Apply user-defined function to extract legend
shared_legend <- extract_legend(plegend)

g1 <- grid.arrange(arrangeGrob(p1, p2, p3, ncol = 1),shared_legend, nrow = 2, heights = c(11, 1))

ggsave("snaq.phi1.true.pdf",g1,device="pdf",units="in",width=6.5,height=4.5)

##################### phi2 true #####################
d2 <- read.table("0.25.True.resultForPlotting.txt", sep = "\t",header=TRUE)
p1 <- ggplot(d2, aes(x=xPos,y=FoundOneEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("One Edge Detected",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5)) + 
  ggtitle(expression(paste("gamma=0.25", sep="")))
p2 <- ggplot(d2, aes(x=xPos,y=CorrectNetwork/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))
p3 <- ggplot(d2, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_text(size=8), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))

plegend <- ggplot(d2, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees))) + 
  geom_point(size=3) +
  scale_shape_manual(name="nTrees", labels=c("250","1000","4000"), values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"),limits=c(-0.1,1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(),axis.text = element_text(size = 8), axis.title = element_text(size = 10), legend.position = "bottom", axis.text.x = element_text(angle = 0), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"))
# Apply user-defined function to extract legend
shared_legend <- extract_legend(plegend)

g2 <- grid.arrange(arrangeGrob(p1, p2, p3, ncol = 1),shared_legend, nrow = 2, heights = c(11, 1))

ggsave("snaq.phi2.true.pdf",g2,device="pdf",units="in",width=6.5,height=4.5)


##################### phi3 true #####################
d3 <- read.table("0.05.True.resultForPlotting.txt", sep = "\t",header=TRUE)
p1 <- ggplot(d3, aes(x=xPos,y=FoundOneEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("One Edge Detected",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5)) + 
  ggtitle(expression(paste("gamma=0.05", sep="")))
p2 <- ggplot(d3, aes(x=xPos,y=CorrectNetwork/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))
p3 <- ggplot(d3, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_text(size=8), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))

plegend <- ggplot(d3, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees))) + 
  geom_point(size=3) +
  scale_shape_manual(name="nTrees", labels=c("250","1000","4000"), values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"),limits=c(-0.1,1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(),axis.text = element_text(size = 8), axis.title = element_text(size = 10), legend.position = "bottom", axis.text.x = element_text(angle = 0), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"))
# Apply user-defined function to extract legend
shared_legend <- extract_legend(plegend)

g3 <- grid.arrange(arrangeGrob(p1, p2, p3, ncol = 1),shared_legend, nrow = 2, heights = c(11, 1))

ggsave("snaq.phi3.true.pdf",g3,device="pdf",units="in",width=6.5,height=4.5)


################### Condense the plot into one #########################
# condense g1,g2,g3
# upgrade data
# .x is phi1, .y is phi2, the rest is phi3
dataC <- data1 %>% left_join(d2, by=c("Diamond","nTrees", "xPos"))
dataC2 <- dataC %>% left_join(d3, by=c("Diamond","nTrees", "xPos"))
dataC3 <- dataC2 %>% 
  pivot_longer(cols = c(FoundOneEdge, FoundOneEdge.x, FoundOneEdge.y, 
                        CorrectNetwork, CorrectNetwork.x, CorrectNetwork.y,
                        HasHybridEdge, HasHybridEdge.x, HasHybridEdge.y), 
               names_to = "Name",
               values_to = c("value")) %>%
  mutate(phi = case_when(
    Name == "FoundOneEdge"|Name == "CorrectNetwork"|Name == "HasHybridEdge" ~ "gamma=0.05",
    Name == "FoundOneEdge.x"|Name == "CorrectNetwork.x"|Name == "HasHybridEdge.x" ~ "gamma=0.5",
    Name == "FoundOneEdge.y"|Name == "CorrectNetwork.y"|Name == "HasHybridEdge.y" ~ "gamma=0.25"
  ))

datafinal <- dataC3 %>%
  mutate(Name = case_when(
    Name %in% c("FoundOneEdge.x", "FoundOneEdge.y") ~ "FoundOneEdge",
    Name %in% c("CorrectNetwork.x", "CorrectNetwork.y") ~ "CorrectNetwork",
    Name %in% c("HasHybridEdge.x", "HasHybridEdge.y") ~ "HasHybridEdge",
    TRUE ~ Name
  )) %>%
  mutate(prop = value/20)

condense <- ggplot(datafinal, aes(x=xPos, y=prop, shape=factor(nTrees))) +
  geom_rect(aes(
    xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf,
    fill = phi
  ), alpha = 0.05) +
  geom_point(size = 3, color = "black") + 
  scale_shape_manual(values = c(1,2,3)) +
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  facet_grid(Name ~ phi) +
  scale_fill_manual(values = c("#e0f3f8", "#f6e6c3", "#f2d0a4"), guide = "none") +  # Soft pastel colors
  theme_minimal() +  # Minimal theme for clean aesthetics
  theme(
    strip.text = element_text(size = 12, face = "bold"),  # Bold facet labels
    axis.text = element_text(size = 10),  # Adjust axis text size for readability
    axis.title = element_text(size = 12),  # Adjust axis titles
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5)  # Title styling
  )

ggsave("CondensedTrueSnaq.pdf", condense, width = 12, height = 5)

condense2 <- ggplot(datafinal, aes(x=xPos, y=prop, shape=factor(nTrees))) +
  geom_rect(aes(
    xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
  ), alpha = 0) +
  geom_point(color = "black", size = 2.25, alpha = 1) + 
  scale_shape_manual(name = "Number of gene trees", values = c(1,2,5)) +
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  facet_grid(Name ~ phi) +  # Minimal theme for clean aesthetics
  theme(
    panel.background = element_rect(fill = "white", colour = "black"),  # White background
    panel.grid = element_blank(),
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.text = element_text(size = 14),
    legend.title = element_text(size = 16),
    strip.text.x = element_text(size = 18, face = "bold"),  # Bold facet labels
    strip.text.y = element_text(size = 14, face = "bold"),
    strip.background = element_blank(),
    axis.text = element_text(size = 12),  # Adjust axis text size for readability
    axis.title = element_text(size = 12),  # Adjust axis titles
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5)  # Title styling
  )

ggsave("CondensedTrueSnaq4.pdf", condense2, width = 12, height = 6.5)

################################# RF_dist ##############################
d4 <- read.table("simulationResults.true.txt", sep = "\t",header=TRUE)
d4_phi1 <- d4 %>% filter(phi == "phi1") %>% filter (RF_dist == 0) %>% 
  group_by(Diamond, nTrees) %>% count(n()) %>% 
  left_join(data1 %>% select(Diamond, nTrees, xPos), by = c("Diamond", "nTrees"))
d4_phi2 <- d4 %>% filter(phi == "phi2") %>% filter (RF_dist == 0) %>% 
  group_by(Diamond, nTrees) %>% count(n()) %>% 
  left_join(data1 %>% select(Diamond, nTrees, xPos), by = c("Diamond", "nTrees"))
d4_phi3 <- d4 %>% filter(phi == "phi3") %>% filter (RF_dist == 0) %>% 
  group_by(Diamond, nTrees) %>% count(n()) %>% 
  left_join(data1 %>% select(Diamond, nTrees, xPos), by = c("Diamond", "nTrees"))

pdist1 <- ggplot(d4_phi1, aes(x=xPos,y=n/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))
pdist2 <- ggplot(d4_phi2, aes(x=xPos,y=n/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))
pdist3 <- ggplot(d4_phi3, aes(x=xPos,y=n/20,shape=factor(nTrees),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Network is Correct",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(), axis.title = element_text(size = 8), legend.position = "none", axis.text.x = element_blank(), axis.text.y = element_text(size=8), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),plot.title = element_text(size=10, hjust = 0.5))

plegend <- ggplot(d4_phi1, aes(x=xPos,y=HasHybridEdge/20,shape=factor(nTrees))) + 
  geom_point(size=3) +
  scale_shape_manual(name="nTrees", labels=c("250","1000","4000"), values=c(1,2,3)) + 
  scale_x_continuous(name=expression(paste("Diamond",sep="")), breaks=c(1,2,3,4,5,6,7,8,9),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[4],sep="")),expression(paste(d[5],sep="")),expression(paste(d[6],sep="")),expression(paste(d[7],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("RF_dist Recovarage",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"),limits=c(-0.1,1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.x = element_blank(),axis.text = element_text(size = 8), axis.title = element_text(size = 10), legend.position = "bottom", axis.text.x = element_text(angle = 0), panel.grid.major.x = element_blank(), plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"))
# Apply user-defined function to extract legend
shared_legend <- extract_legend(plegend)

sg <- grid.arrange(arrangeGrob(pdist1, pdist2, pdist3, ncol = 1),shared_legend, nrow = 2, heights = c(11, 1))

ggsave("RF_dist.true.pdf",g,device="pdf",units="in",width=6.5,height=4.5)

############################## Error Tree ###############################
de <- read.table("Error.resultForPlotting.txt", sep = "\t", header=TRUE)
dep1 <- ggplot(de, aes(x=xPos,y=FoundOneEdge/20,shape=factor(SeqLen),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,5)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("FoundOneEdge",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(), 
        axis.title = element_text(size = 10), 
        legend.position = "none", axis.text.x = element_blank(), 
        axis.text.y = element_text(size=12), 
        panel.grid.major.x = element_blank(), 
        plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),
        plot.title = element_text(size=10, hjust = 0.5))
dep2 <- ggplot(de, aes(x=xPos,y=CorrectNetwork/20,shape=factor(SeqLen),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,5)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("CorrectNetwork",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(), 
        axis.title = element_text(size = 10), 
        legend.position = "none", 
        axis.text.x = element_blank(), 
        axis.text.y = element_text(size=12), 
        panel.grid.major.x = element_blank(), 
        plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),
        plot.title = element_text(size=10, hjust = 0.5))
dep3 <- ggplot(de, aes(x=xPos,y=HasHybridEdge/20,shape=factor(SeqLen),alpha=1.0)) + 
  geom_point(size=3) +
  scale_shape_manual(values=c(1,2,5)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("HasHybridEdge",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"), limits=c(-0.1,1.1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(), 
        axis.title = element_text(size = 10), 
        legend.position = "none", axis.text.x = element_text(size=12), 
        axis.text.y = element_text(size=12), 
        panel.grid.major.x = element_blank(), 
        plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"),
        plot.title = element_text(size=10, hjust = 0.5))

plegend <- ggplot(de, aes(x=xPos,y=HasHybridEdge/20,shape=factor(SeqLen))) + 
  geom_point(size=3) +
  scale_shape_manual(name="Sequence Length", labels=c("250","1000","4000"), values=c(1,2,5)) + 
  scale_x_continuous(name=expression(paste("",sep="")), breaks=c(1,2,3,4,5),labels=c(expression(paste(d[1],sep="")),expression(paste(d[2],sep="")),expression(paste(d[3],sep="")),expression(paste(d[8],sep="")),expression(paste(d[9],sep="")))) + 
  scale_y_continuous(name=expression(paste("Hybrid Edge Recovered",sep="")), breaks=c(0,0.25,0.5,0.75,1.0),labels=c("0","0.25","0.5","0.75","1.0"),limits=c(-0.1,1)) + 
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 16),
        axis.text = element_text(size = 14), 
        axis.title = element_text(size = 10), 
        legend.position = "bottom", 
        axis.text.x = element_text(angle = 0), 
        panel.grid.major.x = element_blank(), 
        plot.margin=unit(c(0.05,0.05,0.05,0.05),"in"))
# Apply user-defined function to extract legend
shared_legend <- extract_legend(plegend)

g <- grid.arrange(arrangeGrob(dep2, dep1, dep3, ncol = 1),shared_legend, nrow = 2, heights = c(11, 1))

ggsave("snaq.error.HKY.pdf",g,device="pdf",units="in",width=6.5,height=5.5)
