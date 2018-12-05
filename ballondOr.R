# Code to analyze soccer statistics for 3 ballon d'or contenders for 2017/2018 & 2018/2019 seasons.
# Author: Benjamin O. Tayo

# Date: 12/05/2018

# Import Necessary Libraries

library(readr)
library(tidyverse)

# Data Importation and Preparation

df<-read.csv("ballondOr.csv")
df<-df%>%mutate(digit = seq(1,4))
df%>%head()
df2<-data.frame(digit=sort(c(df$digit[1:3],df$digit[1:3],df$digit[1:3])),player=as.vector(replicate(3,c("modric","messi","ronaldo"))), 
                metric=c("games","games","games","goals","goals","goals","assists","assists","assists"),
                quantity=c(df$modric[1],df$messi[1],df$ronaldo[1],df$modric[2],df$messi[2],df$ronaldo[2],df$modric[3],df$messi[3],df$ronaldo[3]))
df2%>%head(n=10)



# Generate Barplots for Data Visualization

df2%>%ggplot(aes(digit,quantity,fill=player))+geom_col(position = "dodge", width = 0.75)+
  xlab("metric")+ ylab("quantity")+
  scale_x_continuous(breaks = as.integer(seq(1,3)), labels = c('games','goals','assists'))+
  ggtitle("2017/18 player statistics")+theme_classic()+
  theme(
    plot.title = element_text(color="black", size=11, hjust=0.5, face="bold"),
    axis.title.x = element_text(color="black", size=11, face="bold"),
    axis.text.x = element_text(color="black", size=11, face="bold"),
    axis.text.y = element_text(color="black", size=11, face="bold"),
    axis.title.y = element_text(color="black", size=11, face="bold"),
    legend.title = element_blank()
  )