#!/usr/bin/python

import tweepy, sys

#Récupération des arguments de la commande
arguments = sys.argv
texte = arguments[1]
mediaAUpluoad = arguments[2]


#Identifiants API
API_KEY = 'AzD3qCpQN149KOw6TVCcuJkoe'
API_secret = '1HYnCcFBnseQwV91LgYzjAVlTbULsuqqWtXddJOz3VHnEeWIzr'
BAERER_TOKEN = 'AAAAAAAAAAAAAAAAAAAAACRBZgEAAAAAZvzFyA3hzrgViW4abN8vF52TcK0%3DTTWRQR4VqEXrrXGonP8alLAiZJ40ywRaipbFcEcLlKiOdShVXr'
access_token = '1496555250018402304-P5qxVb6MCjXerOOPmmQL7MIhNRCQUl'
access_token_secret = 'u5SXlRhkMcXCijWcBCiv8NTNyl8GlLxXJrcjkDphwCw7S'

#Connexion API
auth = tweepy.OAuthHandler(API_KEY, API_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)


#Fonctions de Tweet
def post_tweet(text):
    response = api.update_status(text)
    return response

def upload_media(text, filename):
    media = api.media_upload(filename)
    response = api.update_status(text, media_ids=[media.media_id_string])
    return response


print(upload_media(texte, mediaAUpluoad))
