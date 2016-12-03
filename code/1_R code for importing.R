library(data.table)
#setwd("C:/Users/Aayush - Carlson/Desktop/PA/")

## Movie Table
lines = readLines ('./inputdata/movies.txt')
movies <- data.frame(movie_id = character(0), movie_title = character(0), genre = character(0))
movies$movie_id <- as.character(movies$movie_id)
movies$movie_title <- as.character(movies$movie_title)
movies$genre <- as.character(movies$genre)

for (i in 1:length(lines)){
  y <- strsplit(lines[i],"::")
  movies[i,"movie_id"] <- y[[1]][1]
  movies[i,"movie_title"] <- y[[1]][2]
  movies[i,"genre"] <- y[[1]][3]
}

write.csv(movies,"./output/movies.csv",row.names = FALSE)

#User Table
x <- readLines("./inputdata/users.txt")
x <- gsub("::", "*", x)
users = read.table(text=x, sep="*", fill=TRUE,col.names = c('user_id','twitter_id'))
write.csv(users,"./outputdata/users.csv",row.names = FALSE)

#Ratings Table
ratings <- fread("./inputdata/ratings.txt",":")
ratings <- ratings[,.(V1,V3,V5,V7)]
colnames(ratings) <- c("user_id","movie_id","rating","rating_timestamp")
ratings$rating_timestamp <- as.POSIXct(ratings$rating_timestamp, origin="1970-01-01")
write.csv(ratings,"./outputdata/ratings.csv",row.names = FALSE)
