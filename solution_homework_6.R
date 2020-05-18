getwd()
setwd("/home/kartik/Desktop/R_A-Z/datasets")
df = read.csv("Section6-Homework-Data.csv")
head(df)
summary(df)
str(df)
levels(df$Studio)
library(ggplot2)
ggplot(data=df,aes(x=Day.of.Week)) + geom_bar()  # day of week is categorical

# actual challenge
# fitler # 1 for df
filt <- (df$Genre=='action') |(df$Genre=='adventure') |(df$Genre=='drama') |(df$Genre=='animation') |(df$Genre=='comedy') 
filt2 <- df$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")
filt
filt2
mov2 <- df[filt & filt2,]
mov2

# plotting 
p<- ggplot(data=mov2,aes(x=Genre,y=Gross...US))
p + geom_point()

p+ geom_jitter(aes(size=Budget...mill.,colour=Studio)) +geom_boxplot(alpha=0.7) 

# we need to remove the outliers as it is already present by jitters --- remove using outlier.colour
q<-p+ geom_jitter(aes(size=Budget...mill.,colour=Studio)) +geom_boxplot(alpha=0.7,outlier.colour = NA) 
q
q <- q+
      xlab("Genre")+
      ylab("Gross % U.S.")+
      ggtitle("Domestic gross % by Genre")
q

# add a theme layer 
q<- q+
    theme(axis.title.x = element_text(colour='Blue',size=30),
          axis.title.y = element_text(colour='Blue',size=30),
          axis.text.x = element_text(size=20),
          axis.text.y = element_text(size=20),
          plot.title = element_text(size=40),
          legend.title = element_text(size=20),
          legend.text = element_text(size=20),
          text = element_text(family="NimbusMon")
          )
q

# final touch 
q$labels$size <- "Budget $M"
q


















