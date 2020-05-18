# integer 
x<-2L 
typeof(x)
#double
y <- 2.5
typeof(y)

# complex
z<-3+2i
typeof(z)

#character
a <- 'kideon'
typeof(a)
#logical
q1<- TRUE 
typeof(q1)


A<-10
B <- 5
C <- A+B
C

VAR1 <-2.5
VAR2<-4
result<- VAR1/VAR2
answer<-sqrt(VAR1)  #function

greeting1 <-"hello"
name1 <- "bob"
message<-paste(greeting1,name1)  #for joining 2 strings we use paste function
message

4<5
4==5
result<- (4>5)
result

# While loop
while (TRUE){   #curly braces is body of loop
  print("hello")
  }                 #to print something within a loop we need to use print
  
counter<-1
while(counter<12){
  print(counter)
  counter<- counter+1
}
# for loop
 for (i in 1:5){   # 1:5 is the range of i
   print("hello R")
 }

1:5    #this is a vector 

# IF , ELSE statement
#rnorm function generates a set of random normally distributed numbers

  # this rm function removes the variable -- as answer is stored so it will be same so we remove it ever
rm(answer)
x <- rnorm(1)
if(x>1){
  answer<-"greater than 1"
} else if(x>=-1){
  answer<-"between -1 and 1"
} else{
  answer<-'less than -1'
  }























