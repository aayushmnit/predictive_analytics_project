#import the library used to query a website
from imdb import IMDb
import pandas as pd
import pickle
ia = IMDb()

movies = pd.read_csv('C:/Users/Aayush - Carlson/Desktop/PA/movies.csv')
movies['Plot'] = movies.apply(lambda _: '', axis=1)

for i in range(len(movies.movie_id)):
    print i
    if i % 100 == 0:
        .
    try:
        a = ia.get_movie(movies.movie_id[i])
        movies['Plot'][i] = a['plot'][0]
    except:
        pass
    
pickle.dump(movies, open('C:/Users/Aayush - Carlson/Desktop/PA/movies.p', 'wb'))