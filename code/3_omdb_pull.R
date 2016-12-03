#devtools::install_github("hrbrmstr/omdbapi")
library(omdbapi)
library(dplyr)
library(stringr)

movies <- read.csv("./output/movies.csv")
movies$movie_id <- str_pad(movies$movie_id, 7, pad = "0")
movies$imdb_id <- paste('tt',movies$movie_id,sep ="")

movie_omdb <- find_by_id(movies[1,'imdb_id'])
for (i in 1:nrow(movies)){
  movie_omdb <- rbind(movie_omdb,find_by_id(movies[i,'imdb_id']))
  print(i)
}

write.csv(movie_omdb,"./output/movie_omdb.csv",row.names = FALSE)
