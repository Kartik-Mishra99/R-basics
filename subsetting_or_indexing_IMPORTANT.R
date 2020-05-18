x<- c("a","b","c","d","e")
x
x[c(1,5)]  # extracting the first and fifth element
x[1]

Games
Games[1:3,6:10]

Games[c(1,10),] # selecting rows only and all columns as ","
Games[,c("2008","2009","2010")]
Games[1,]  # we are getting vector and not matrix
is.matrix(Games[1,])
is.vector(Games[1,])
Games[1,5]  # we are getting vector and not matrix

# to get the matrix and not vector we will do  :
Games[1,,drop=F]  #Now R is no longer dropping a dimension 
Games[1,5,drop=F]  # F is false









