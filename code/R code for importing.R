library(data.table)
setwd("C:/Users/Aayush - Carlson/Desktop/PA/")

## Movie Table
lines = readLines ('movies.txt')
lines <- gsub("::", "*", lines)
movies = read.table(text=lines, sep="*", fill=TRUE, col.names = c('movie_id','movie_title','genre'))
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
