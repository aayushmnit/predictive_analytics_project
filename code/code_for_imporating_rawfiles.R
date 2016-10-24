library(rjson)
library(XML)
library(reshape)
setwd("C:/Users/Aayush - Carlson/Desktop/PA/")


x <- readLines("movies.txt")
movies <- nodata <- data.frame("ID"= numeric(0), "MovieName"= integer(0), "Genre" = character(0))
movies$Genre <- as.character(movies$Genre)
for (i in 1:length(x)){
  y <- strsplit(x[i],"::")
  movies[i,1] <- y[[1]][1]
  movies[i,2] <- y[[1]][2]
  movies[i,3] = y[[1]][3]
}
write.csv(movies,"movies.csv",row.names = FALSE)

x <- readLines("users.txt")
users <- data.frame("ID"= numeric(0), "UserID"= integer(0))
for (i in 1:length(x)){
  y <- strsplit(x[i],"::")
  users[i,1] <- y[[1]][1]
  users[i,2] <- y[[1]][2]
}
write.csv(users,"users.csv",row.names = FALSE)

x <- readLines("ratings.txt")
ratings <- data.frame("1"= numeric(0), "2"= integer(0),"3"= integer(0),"3"= integer(0))
for (i in 1:length(x)){
  y <- strsplit(x[i],"::")
  ratings[i,1] <- y[[1]][1]
  ratings[i,2] <- y[[1]][2]
  ratings[i,3] <- y[[1]][3]
  ratings[i,4] <- y[[1]][4]
}
a <- as.data.frame(colsplit(x,"::",names = c("1","2","3","4")))
write.csv(a,"ratings.csv",row.names = FALSE)


strsplit(x[1],"::")
