import logging
from flask import Flask
from flask_ask import Ask, statement, question, session
import mysql.connector
from ConstantFunctions import *
from PokemonNumberResponseBuilder import *
from PokemonTypeResponseBuilder import *

app = Flask(__name__)
ask = Ask(app, "/")
logging.getLogger("flask_ask").setLevel(logging.DEBUG)

@ask.launch
def launchAppWithoutIntent():
    return buildQuestion()

@ask.session_ended
def closeApp():
    return "{}", 200

@ask.intent('PokemonNumberIntent')
def getPokemonNumber(pokemon):
    return generalQuery(pokemon, PokemonNumberResponseBuilder)

def getPokemonType(pokemon):
    return generalQuery(pokemon, PokemonTypeResponseBuilder)

def generalQuery(key, responseBuilder):
    connection = mysql.connector.connect(user="hehe", password="notThisTime",
                                  host="gen1pokemonapp.cacuxkbfp0fa.us-east-2.rds.amazonaws.com",
                                  database="Gen1PokemonApp")

    cursor = connection.cursor()
    cursor.execute(responseBuilder.query(key))

    return responseBuilder.buildResponse(cursor, key)