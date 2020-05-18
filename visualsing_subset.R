
Data <- MinutesPlayed[1:3,]  # top 3 players
Data
matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players[1:3],pch=15:18,col=c(1:4,6),horiz = F)


# visualsing just kobe (top)
Data <- MinutesPlayed[1,,drop=F]    # TRICKKKKKK OF SUBSETTING (we want a matrix)
matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players[1],pch=15:18,col=c(1:4,6),horiz = F)
Data
