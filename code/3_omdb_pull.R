#devtools::install_github("hrbrmstr/omdbapi")
library(omdbapi)
library(dplyr)
setwd("C:/Users/Aayush - Carlson/Desktop/PA/")

movies <- read.csv("movies.csv")
movies$imdb_id <- paste('tt',movies$movie_id,sep ="")

movie_omdb <- find_by_id(movies[1,'imdb_id'])
for (i in 12162:nrow(movies)){
  movie_omdb <- rbind(movie_omdb,find_by_id(movies[i,'imdb_id']))
  print(i)
}
x <- find_by_id(movies[10257,'imdb_id'])[,colnames(movie_omdb)]
movie_omdb <- rbind(movie_omdb,x)
#10030
#10257
write.csv(movie_omdb,"movie_omdb.csv",row.names = FALSE)
