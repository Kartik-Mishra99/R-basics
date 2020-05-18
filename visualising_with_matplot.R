?matplot()
matplot(FieldGoals)
FieldGoals
t(FieldGoals)  # transposing 
matplot(t(FieldGoals/Games),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players,pch=15:18,col=c(1:4,6),horiz = F)


matplot(t(FieldGoals/FieldGoalAttempts),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players,pch=15:18,col=c(1:4,6),horiz = F)


matplot(t(Salary/Points),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players,pch=15:18,col=c(1:4,6),horiz = F)

matplot(t(Points/Games),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players,pch=15:18,col=c(1:4,6),horiz = F)


matplot(t(Points/MinutesPlayed),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01, legend = Players,pch=15:18,col=c(1:4,6),horiz = F)
