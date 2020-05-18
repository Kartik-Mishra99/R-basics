Games
rownames(Games)
colnames(Games)
Games["LeBronJames","2011"]

FieldGoals
#calculating field goals scored by simply dividing matrices
round(FieldGoals/Games,1)

MinutesPlayed
round(MinutesPlayed/Games)

FieldGoalAttempts
round(FieldGoalAttempts/Games)

round(FieldGoals/FieldGoalAttempts,2)
