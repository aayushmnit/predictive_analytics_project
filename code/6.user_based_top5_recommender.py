import pandas as pd
import codecs 
from math import sqrt

ratings = pd.read_csv('ratings.csv',usecols = [0,1,2])

def to_dict (frame):
    d = {}
    for row in frame.values:
            user = row[0]
            movie = row[1]
            rating = row[2]
            if user not in d:
                d[user] = {}
                d[user][movie]=rating
            else:
                d[user][movie]=rating
    return d

temp = to_dict(ratings)

def pearson(rating1, rating2):
    sum_xy = 0
    sum_x = 0
    sum_y = 0
    sum_x2 = 0
    sum_y2 = 0
    n = 0
    for key in rating1:
        if key in rating2:
            n += 1
            x = rating1[key]
            y = rating2[key]
            sum_xy += x * y
            sum_x += x
            sum_y += y
            sum_x2 += pow(x, 2)
            sum_y2 += pow(y, 2)
    if n == 0:
        return 0
    # now compute denominator
    denominator = sqrt(sum_x2 - pow(sum_x, 2) / n) * sqrt(sum_y2 - pow(sum_y, 2) / n)
    if denominator == 0:
        return 0
    else:
        return (sum_xy - (sum_x * sum_y) / n) / denominator
            

def computeNearestNeighbor(u, ratings):
    """creates a sorted list of users based on their distance to username"""
    distances = []
    for user in ratings:
        if user != u:
            distance = pearson(ratings[user], ratings[u])
            if distance <> 0:
                distances.append((distance, user))
    # sort based on distance -- closest first
    distances.sort()
    return distances

def recommend(u, ratings):
    """Give list of recommendations"""
    # first find nearest neighbor
    distances = computeNearestNeighbor(u, ratings)
    if not distances:
        return
    else:
        nearest = distances[0][1]

    recommendations = []
    # now find movies neighbor rated that user didn't
    neighborRatings = ratings[nearest]
    userRatings = ratings[u]
    for movie in neighborRatings:
        if not movie in userRatings:
            recommendations.append((movie, neighborRatings[movie]))
    # using the fn sorted for variety - sort is more efficient
    # reurn top 5 movie recommendations
    return sorted(recommendations, key=lambda movieTuple: movieTuple[1], reverse = True)[:5]
    


