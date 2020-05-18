#### Creating a Function -- just add keyword function
myplot <- function(){
  Data <- MinutesPlayed[2:3,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset = 0.01, legend = Players[2:3],pch=15:18,col=c(1:4,6),horiz = F)
}

myplot()

###3 function with parameter 
myplot_param <- function(rows){
  Data <- MinutesPlayed[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset = 0.01, legend = Players[rows],pch=15:18,col=c(1:4,6),horiz = F)
}

myplot_param(4:10)


myplot_param <- function(rows,column){
  Data <- column[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset = 0.01, legend = Players[rows],pch=15:18,col=c(1:4,6),horiz = F)
}

myplot_param(4:10,Games)

# setting a default paramters for function 

myplot_param_default <- function(column,rows=1:10){    # default is all rows(all players here)
  Data <- column[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
  legend("bottomleft",inset = 0.01, legend = Players[rows],col=c(1:4,6),pch=15:18,horiz = F)
}

myplot_param_default(Games,1:4)  # passing desired rows
myplot_param_default(MinutesPlayed/Games)  #using the default rows












