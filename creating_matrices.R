Salary
Games
MinutesPlayed
Seasons

# CREATING OUR OWN MATRIX
?matrix()
mydata <- 1:20
mydata
A<-matrix(mydata,4,5)
A
A[2,3]

B<-matrix(mydata,4,5,byrow = T)  # this T means TRUE
B

# rbind  and cbind function 
r1 <- c("I","am","Happy")
r2 <- c("what","a","day")
r3 <- c(4,5,6)
c_matrix <- cbind(r1,r2,r3)
r_matrix <- rbind(r1,r2,r3)
c_matrix
r_matrix

c1 <- 1:5
c2 <- -1:-5
d <- cbind(c1,c2)
d



















