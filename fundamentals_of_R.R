vector<- c(3,45,75,43)  # c is the combine function
is.numeric(vector)
is.integer(vector)
is.double(vector)

v2 <- c(12L,32L,0L)
is.numeric(v2)

v2 <- c("hello","abc")
typeof(v2)
v3 <- c("hello","abc",746)
typeof(v3)
v3

# seq() is similar to ";"  rep() is replicate  ,,,, seq is like range of python
seq(1:15)
seq(1,15)   # just use a comma instead of colon :
seq(1,15,2)  # 2 is step size

z<- seq(1,15,4)
z

d<-rep(z,50)  # replicate z 50 times
d
rep("a",5)
x<- c(80,320)   # c makes a vector
rep(x,5)


# using [] brackets ------  INDEXING IN R  -----------
w <-c("a","b","c","d","e")
w[1:4]
w[]  #gives everything
w[-1] # everything except a
w[3]
v<-w[1:3]
v
w[c(1,3,5)]
w[c(-2,-4)]
-3:-5
w[-3:-5]
w[1:2]


                             #### VECTORIZED OPERATIONS ####
a<- c(10,20,30)
b<- c(20,30,40)
c<- c(30,40,50)
d = a+b+c
d

# R-specific loop  
x<- rnorm(5)
for(i in x){
  print(i)
}
print(x[1])
print(x[1:4])

#conventional programming loop
for (j in 1:5){
print(x[j])
}

######## VECTORIZED V/S DEVECTORIZED OPERATIONS 
n <- 100
a <- rnorm(n)
b <- rnorm(n)

# vectorized approach
c <- a*b
c
# devectorized approach
d <- rep(NA,n)  # no value -- empty vector in R
for (i in 1:n){
  d[i] <- a[i] * b[i]
}
d


###########       FUNCTIONS     #################

?rnorm()  # this question mark before function displays the help for function
?paste()
?c()
?seq()
rnorm(5,10,8)
seq(from=10,to=20,length.out = 100)
x<- c("a","b","c")
rep(x,each=5)

d<- seq(from=10,to=20,along.with = 100)
b<- sqrt(d)
b

?ggplot
?qplot()
?diamonds
qplot(data=diamonds,x=carat,y=price,colour=clarity,facets = .~clarity)
    























