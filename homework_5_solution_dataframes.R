# HOMEWORK CHALLENGE PART 5 SOLUTION

#loading the data
getwd()
data <- read.csv("P2-Section5-Homework-Data.csv")
head(data)
tail(data)
str(data)
summary(data)

data$Year
# turning this numeric variable into factor(categorical)
temp <- factor(data$Year)
temp
levels(temp)

# split the dataframe into 2 years
data_1960 <- data[data$Year=="1960",]
data_1960
data_2013 <- data[data$Year=="2013",]
data_2013
nrow(data_1960)  # 187 rows
nrow(data_2013)  # 187 rows

# create additional dataframes
add1960 = data.frame(code = Country_Code , life_exp = Life_Expectancy_At_Birth_1960)
add2013 = data.frame(code = Country_Code , life_exp = Life_Expectancy_At_Birth_2013)
summary(add1960)
summary(add2013)

# merging the dataframes
merged_1960 = merge(data_1960,add1960,by.x="Country.Code",by.y="code")
merged_2013 = merge(data_2013,add2013,by.x="Country.Code",by.y="code")
str(merged_1960)
head(merged_2013)

# deleting columns of year as they are not required
merged_1960$Year<- NULL
merged_2013$Year<- NULL
head(merged_1960)

# visualise the 1960 dataset
qplot(data=merged_1960 , x= life_exp , y= Fertility.Rate,colour = Region,size=I(3),
      alpha = I(0.6),main='Life Expectancy v/s Fertility Rate 1960')

# visualise the 2013 dataset
qplot(data=merged_2013 , x= life_exp , y= Fertility.Rate,colour = Region,size=I(3),
      alpha = I(0.6),main='Life Expectancy v/s Fertility Rate 2013')











