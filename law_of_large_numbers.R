# LAW OF LARGE NUMBERS 
N<-100
counter <- 0
for (i in rnorm(N)){
  if(i>-1 & i<1){
    counter <- counter + 1
  }
}
percent <-counter/100
percent
#compare percent to 68.2%

