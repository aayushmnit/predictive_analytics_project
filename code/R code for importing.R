library(data.table)
setwd("C:/Users/Aayush - Carlson/Desktop/PA/")

## Movie Table
x <- readLines("movies.txt")
movies <- data.frame("movie_id"= numeric(0), "movie_title"= integer(0), "genre" = character(0))
movies$Genre <- as.character(movies$Genre)
for (i in 1:length(x)){
  y <- strsplit(x[i],"::")
  movies[i,1] <- y[[1]][1]
  movies[i,2] <- y[[1]][2]
  movies[i,3] = y[[1]][3]
}
write.csv(movies,"movies.csv",row.names = FALSE)

#User Table
x <- readLines("users.txt")
x <- gsub("::", "*", x)
users = read.table(text=x, sep="*", fill=TRUE,col.names = c('user_id','twitter_id'))
write.csv(users,"users.csv",row.names = FALSE)

#Ratings Table
ratings <- fread("ratings.txt",":")
ratings <- ratings[,.(V1,V3,V5,V7)]
colnames(ratings) <- c("user_id","movie_id","rating","rating_timestamp")
ratings$rating_timestamp <- as.POSIXct(ratings$rating_timestamp, origin="1970-01-01")
write.csv(ratings,"ratings.csv",row.names = FALSE)
