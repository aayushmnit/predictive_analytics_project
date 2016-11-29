# -*- coding: utf-8 -*-
"""
Created on Fri Nov 11 16:51:33 2016

@author: Aayush - Carlson
"""

#Importing Library
import graphlab as gl

# Import File
data = gl.SFrame('C:/Users/Aayush - Carlson/Desktop/PA/ratings.csv')

#Making Rating dataset , Movie and User data set
sf = gl.SFrame({'user_id':data['user_id'],'item_id': data['movie_id'],'rating' : data['rating']})
users = gl.SFrame('C:/Users/Aayush - Carlson/Desktop/PA/users.csv')
movies = gl.SFrame('C:/Users/Aayush - Carlson/Desktop/PA/movies.csv')
movies = gl.SFrame({'item_id': movies['movie_id'],'title' : movies['movie_title'],'genre': movies['genre']})

#Making Recommender system
m = gl.factorization_recommender.create(sf, target='rating')

# Basic training and testing split methodology
high_rated_data = sf[sf["rating"] >= 4]
low_rated_data = sf[sf["rating"] < 4]
train_data_1, test_data = gl.recommender.util.random_split_by_user(high_rated_data, user_id='user_id', item_id='item_id')
train_data = train_data_1.append(low_rated_data)

# Two model comparison using graphlab compare
m1 = gl.factorization_recommender.create(train_data, target='rating')
m2 = gl.recommender.create(train_data, target='rating')
gl.recommender.util.compare_models(test_data, [m1, m2], model_names=["m1", "m2"])