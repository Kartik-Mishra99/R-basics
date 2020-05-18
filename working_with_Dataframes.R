# LOADING DATA

?read.csv()

# method 1 - select the file manually
stats <- read.csv(file.choose())
stats

# method 2 - set the working directory and read data from there
getwd()   #working directory
setwd('/home/kartik/Desktop/R_A-Z/datasets')
getwd()
rm(stats)   #imported from method 1
stats <- read.csv("P2-Demographic-Data.csv")
stats
# ------------------------------------------------------------------------------------------------------#

# EXPLORING DATA 

nrow(stats)  #gives no. of rows in df
# imported 195 rows
ncol(stats)  # imported 5 columns
head(stats,n=10)
tail(stats)
str(stats)  #similar to dtypes and describe in pandas -- IMPORTANT str-stands for Structure 
# runif() - random variable distributed normally
summary(stats)

#---------------------------------------------------------------------------------------------------#
# USING THE $ SIGN
# used to access data in a dataframe ,,, doesn't work for matrix

head(stats)  # displays top 6 rows
stats[3,3]  # angola birth rate
stats[3,"Birth.rate"]
#using $ sign
stats$Internet.users  # returns whole internet column(all rows) as a long vector ---- similar to stats[,"internet"]
stats$Internet.users[2]
levels(stats$Income.Group)  # levels gives all the subcategories in a  (categorical column)

#---------------------------------------------------------------------------------------------------#
# BASIC OPERATIONS WITH DATAFRAME

# SUBSETTING

stats[1:10,]  #first 10 rows + all cols   
stats[c(4,100),]  # 4th and 100th row
stats[1,]  #in matrix when we extract one row it turns into a vector but doesnt happen in dataframe so no need for drop =FALSE parameter
is.data.frame(stats[1,])
stats[,1]

# but when we extract a single column then we get a vector so we use drop=False -- IMPORTANT
stats[,1]
stats[,1,drop=F]
is.data.frame(stats[,1,drop=FALSE])  

stats$Birth.rate * stats$Internet.users  # output a vector--- vector multiplication

# adding a column to df

stats$my_calc <- stats$Birth.rate * stats$Internet.users  # assume that we already have our column new stats 
head(stats)
# test of knowledge -- add a column xyz with a vector that only has 5 values
stats$xyz <-1:5  # vector of insufficient length is recycled
head(stats,n=10)

# removing a column 

stats$my_calc <- NULL
stats$xyz <- NULL # take the column and assign it a value of null
head(stats)

#---------------------------------------------------------------------------------------------------#
# FILTERING IN DATAFRAME 

filter<- stats$Internet.users <2 #which countries have less than 2 percent
filter
stats[filter,]  #viewing the TRUE rows -- for true it display the row for false it doesn't diplay the row -- first position is for true 2nd is for false so we are leavving 2nd position empty as we dpoont want false

stats[stats$Birth.rate>40,] # countries with birthyrate more than 40

stats[stats$Birth.rate>40 & stats$Internet.users<2 ,]  # multiple filtering
# filtering by categorical variable
 stats[stats$Income.Group=="High income",]
 stats[stats$Income.Group=="Lower middle income",]
# find information for "malta" country
 stats[stats$Country.Name=="Malta",]

 
 #-------------------------------------------------------------------------------------------------#
 # INTRODUCTION TO Q-PLOT
 # 1 -it works on ggplot2 package
library(ggplot2)
?qplot
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))  # we have used I around the value because otherwise q-plot will make it as a legend(try yourself)
# boxplot
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot",colour=I("red"))

#-----------------------------------------------------------------------------------------------#
# VISUALISING WITH Q-PLOT PART 1
qplot(data=stats,x=Internet.users,y=Birth.rate)
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(3),colour=I("red"))
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(3),colour=Income.Group)

#---------------------------------------------------------------------------------------------------#
# CREATING DATAFRAMES 
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)  #using dataframe function
head(mydf)
## RENAMING COLUMNS 
colnames(mydf) <- c("country","code","region")
head(mydf)
rm(mydf)   # removing df
### TRICK  for giving coustom nmames directly
mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset) 
head(mydf)   # got the same df as above  here no need to use colnames function
# this approach works in both cbind and rbind as well -- IMPORTANT
summary(mydf)

#-----------------------------------------------------------------------------------------------------#
# MERGING DATAFRAMES
head(stats)
head(mydf)
# we will merge on country codes as they are same using merge function
merged <- merge(stats,mydf,by.x= "Country.Code" , by.y = "Code")#stats on left and we want to use its country code so use by.x and viceversa , mydf on right
head(merged)  # R dropped code column as it is same as country.code so to avoid repetition
# country column is duplicate so we remove it
merged$Country<- NULL
str(merged)
summary(merged)
tail(merged)

#---------------------------------------------------------------------------------------------------#
# VISUALISING WITH QPLOT PART 2
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(3))
# shapes
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(3),
      shape=I(2))  # for the shape numbers google "R shapes" it will give you the shape numbers
# transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(3),
      shape=I(19),alpha=I(0.5))   # alpha is transparency-- 0-1 (0 is totally transparent)
# adding title 
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(3),
      shape=I(2),main ="Birth rate v/s Internet users")  # main gives the title

#---------------------------------------------------------------------------------------#









