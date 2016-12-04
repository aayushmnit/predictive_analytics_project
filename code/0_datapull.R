library(devtools)

source_GitHubData <-function(url, sep = ",", header = TRUE)
{
  require(httr)
  request <- GET(url)
  stop_for_status(request)
  handle <- textConnection(content(request, as = 'text'))
  on.exit(close(handle))
  read.table(handle, sep = sep, header = header)
}


movies <- source_GitHubData(url = "https://raw.githubusercontent.com/sidooms/MovieTweetings/master/latest/movies.dat",header = FALSE)
write.table(movies,"./inputdata/movies.dat",col.names = NA)

ratings <- source_GitHubData(url = "https://raw.githubusercontent.com/sidooms/MovieTweetings/master/latest/ratings.dat",header = FALSE)
write.table(ratings,"./inputdata/ratings.dat",col.names = NA)

users <- source_GitHubData(url = "https://raw.githubusercontent.com/sidooms/MovieTweetings/master/latest/users.dat",header = FALSE)
write.table(movies,"./inputdata/users.dat",col.names = NA)