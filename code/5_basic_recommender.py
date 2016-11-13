# -*- coding: utf-8 -*-
"""
Created on Fri Nov 11 16:51:33 2016

@author: Aayush - Carlson
"""

import graphlab as gl
cd C:\\Users\\Aayush - Carlson\\Desktop\\PA
data = gl.SFrame('C:/Users/Aayush - Carlson/Desktop/PA/ratings.csv')

sf = gl.SFrame({'user_id':data['user_id'],'item_id': data['movie_id'],'rating' : data['rating']})
m = gl.recommender.create(sf, target='rating')

sf1 = m.recommend()

sf1.save('sf1',format='csv')