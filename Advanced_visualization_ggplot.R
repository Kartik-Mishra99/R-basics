getwd()
movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
tail(movies)
str(movies)
levels(movies$Genre)
summary(movies)
# movies[movies$BudgetMillions==300,] # highest budget movie
# converting our year into factor -- IMPORTANT

# FACTORS
movies$Year <- factor(movies$Year)
summary(movies)
levels(movies$Year)
str(movies)

#---------------------------------------------------------------------#
# AESTHETICS
# loading the package 
library(ggplot2)
?ggplot    
# aes is aesthetics -- aesthetics are things that we can see
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating)) # displays blank 
# add geometry layer to view the points
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating)) + geom_point()
# add colour
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre)) + geom_point()
# add size
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=I(3))) + geom_point()

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=Genre)) + geom_point()
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions)) + geom_point()

# THIS IS # 1 we will improve it

# -----------------------------------------------------------------------------------------#
# PLOTTING WITH LAYERS
P<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
P
# point
P+geom_point()
# lines
P+geom_line()
# multiple layers
P + geom_line() + geom_point()

#------------------------------------------------------------------------------------------#
#OVERRIDING AESTHETICS
q<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
# add geom layers
q+ geom_point()
# overriding aesthetics
q+geom_point(aes(size=CriticRating))   # size criticrating has overrided budgetmillion 
# example 2
q+geom_point(aes(colour=BudgetMillions))
# q remains the same
q+geom_point()
# overriding x and y as well
q+geom_point(aes(x=BudgetMillions))+ xlab("budgetMillion ($)")  # dont forget to update the axis label

P+geom_line() + geom_point()  
# reduced line size
P+geom_line(size=1) + geom_point()  # mapping vs setting

#--------------------------------------------------------------------------------------#
# MAPPING VS SETTING 

q+geom_point(aes(x=BudgetMillions))+ xlab("Budget IN Million ($)")  # dont forget to update the axis label

r<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
r + geom_point()
# add colour
#1- mapping
r+geom_point(aes(colour=Genre))
#2- setting
r+geom_point(colour='darkgreen')
# ERROR :
# r+geom_point(aes(colour='darkgreen')) # we are mapping this colour 

# add size
# mapping 
r+ geom_point(aes(size=BudgetMillions))
#2- setting
r+geom_point(size=10)
# ERROR :
# r+geom_point(aes(size=10)) # we are mapping this colour 

#-----------------------------------------------------------------------------------------#
# HISTOGRAM AND DENSITY CHARTS
s <- ggplot(data=movies,aes(x=BudgetMillions))
s+ geom_histogram(binwidth = 10)

# add colour
s+ geom_histogram(binwidth = 10,fill="green")  # this is setting the colour
s+ geom_histogram(binwidth = 10,aes(fill=Genre))  # this is mapping
# add a border
s+ geom_histogram(binwidth = 10,aes(fill=Genre),color="black")  #color-black makes a border
### chart no. 3 we will improve it

# DENSITY CHARTS 
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position='stack')  # to stack on each other - IMPORTANT

# ----------------------------------------------------------------------------------------#
# STARTING LAYERS TIPSSS
t <- ggplot(data=movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,fill='White',colour='Blue')
# another way
t<- ggplot(data=movies)
t + geom_histogram(binwidth = 10,fill='gray',colour='black',aes(x=AudienceRating))
# 4th chart
t + geom_histogram(binwidth = 10,fill='gray',colour='Black',aes(x=CriticRating))

#------------------------------------------------------------------------------------------#
# STATISTICAL TRANSFORMATIONS
?geom_smooth 
u <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
u+ geom_point() + geom_smooth()
u+ geom_point() + geom_smooth(fill=NA)

# boxplots 
# mean is the center line
# narrow or smaller the box means smaller variance and better plot
u <- ggplot(data=movies,aes(x=Genre,y=AudienceRating,colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
# tip -  important    
u + geom_boxplot(size=1.2) + geom_jitter()  # to spread the point (used with boxplots)
u +geom_jitter() + geom_boxplot(size=1.2,alpha=0.5) 
# chart 6

#-----------------------------------------------------------------------------------------#
# FACETS 
v <- ggplot(data=movies,aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,aes(fill=Genre),colour='black')
# facets - to create lots of charts 
v + geom_histogram(binwidth = 10,aes(fill=Genre),colour='black') + 
    facet_grid(Genre~.)  # before ~ is rows after ~ is column so we want all rows for genre
v + geom_histogram(binwidth = 10,aes(fill=Genre),colour='black') + 
  facet_grid(Genre~.,scales='free')

# scatter plots 
w<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
w +geom_point(size=3) + facet_grid(Genre~.) 
w +geom_point(size=3) + facet_grid(.~Year)
w +geom_point(size=3) + facet_grid(Genre~Year)
w + geom_point(size=2) + geom_smooth() +facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +facet_grid(Genre~Year)
# char 1 improved but will still improve

#-----------------------------------------------------------------------------------------#
# COORDINATES
# controlling our coordaintes as our axis is going from -50 to 150
# 1- limit ouR AXES
#2 - zoom our axes
m <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
m + geom_point()
m + geom_point() + xlim(50,100) + ylim(50,100)
# wont work well always
n <- ggplot(data=movies,aes(x=BudgetMillions,colour=Genre))
n+ geom_histogram(binwidth = 10,aes(fill=Genre),colour='black')
n+ geom_histogram(binwidth = 10,aes(fill=Genre),colour='black')+ ylim(0,50) 

# how to we zoom in?
n+ geom_histogram(binwidth = 10,aes(fill=Genre),colour='black')+ coord_cartesian(ylim = c(0,50)) # this will zoom in
# improving number 1 chart
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +facet_grid(Genre~Year)+ 
    coord_cartesian(ylim = c(0,100))


#-----------------------------------------------------------------------------------------#
# PERFECTING BY ADDING THEMES

o<- ggplot(data=movies,aes(x=BudgetMillions))
h<-o + geom_histogram(binwidth = 10,aes(fill=Genre),colour='black')
h
# adding an axes labels
h+xlab("money axis") + ylab("no. of movies")

# label formatting
h+
  xlab("money axis") + ylab("no. of movies") + 
  theme(axis.title.x = element_text(colour="dark green",size=30),
        axis.title.y =element_text(colour='red',size=30))

# tick mark formatting
h+
  xlab("money axis") + ylab("no. of movies") + 
  theme(axis.title.x = element_text(colour="dark green",size=30),
        axis.title.y =element_text(colour='red',size=30),
        axis.text.x = element_text(size=20),
        axis.text.y= element_text(size=20))

?theme

#legend formatting
h+
  xlab("money axis") + ylab("no. of movies") + 
  theme(axis.title.x = element_text(colour="dark green",size=30),
        axis.title.y =element_text(colour='red',size=30),
        axis.text.x = element_text(size=20),
        axis.text.y= element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1)) # it want to put the top right corner of legend in top right corner of the chart
        
# title of the plot
h+
  xlab("money axis") + ylab("no. of movies") + ggtitle("movie budget distribution") + 
  theme(axis.title.x = element_text(colour="dark green",size=30),
        axis.title.y =element_text(colour='red',size=30),
        axis.text.x = element_text(size=20),
        axis.text.y= element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour="dark blue",size=40,family = "Courier"))




