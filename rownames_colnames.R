# named vectors 
charlie <- 1:5
charlie

#give names

?names()
names(charlie) <- c("a","b","c","d","e")
charlie
charlie["d"]
names(charlie)

#clear names

names(charlie)<- NULL
names(charlie)

# naming matrix dimensions
temp_vec  <- rep(c("a","B","zz"),times=3)
temp_vec_each  <- rep(c("a","B","zz"),each=3)
temp_vec
temp_vec_each

bravo <- matrix(temp_vec_each,3,3)
bravo
rownames(bravo) <- c("how","are","you")
rownames(bravo)
colnames(bravo) <- c("x","y","z")
colnames(bravo)
bravo
bravo["are","y"] <- 0
bravo
# removing rownames and colnames
rownames(bravo) <- NULL
rownames(bravo)
bravo

