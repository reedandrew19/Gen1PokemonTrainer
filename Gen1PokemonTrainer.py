import logging
from flask import Flask
from flask_ask import Ask, statement, question, session
import mysql.connector
from ConstantFunctions import *
from PokemonNumberResponseBuilder import *
from PokemonTypeResponseBuilder import *
from PokemonClassificationResponseBuilder import *
from PokemonHeightResponseBuilder import *
from PokemonWeightResponseBuilder import *
from PokemonCaptureRateResponseBuilder import *
from PokemonEvolvedFromResponseBuilder import *
from PokemonBaseHPResponseBuilder import *
from PokemonBaseAttackResponseBuilder import *
from PokemonBaseDefenseResponseBuilder import *
from PokemonBaseSpecialResponseBuilder import *
from PokemonBaseSpeedResponseBuilder import *
from PokemonEvolutionResponseBuilder import *

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

@ask.intent('PokemonTypeIntent')
def getPokemonType(pokemon):
    return generalQuery(pokemon, PokemonTypeResponseBuilder)

@ask.intent('PokemonClassificationIntent')
def getPokemonClassification(pokemon):
    return generalQuery(pokemon, PokemonClassificationResponseBuilder)

@ask.intent('PokemonHeightIntent')
def getPokemonHeight(pokemon):
    return generalQuery(pokemon, PokemonHeightResponseBuilder)

@ask.intent('PokemonWeightIntent')
def getPokemonWeight(pokemon):
    return generalQuery(pokemon, PokemonWeightResponseBuilder)

@ask.intent('PokemonCaptureRateIntent')
def getPokemonCaptureRate(pokemon):
    return generalQuery(pokemon, PokemonCaptureRateResponseBuilder)

@ask.intent('PokemonEvolvedFromIntent')
def getPokemonEvolvedFrom(pokemon):
    return generalQuery(pokemon, PokemonEvolvedFromResponseBuilder)

@ask.intent('PokemonEvolutionIntent')
def getPokemonEvolution(pokemon):
    return generalQuery(pokemon, PokemonEvolutionResponseBuilder)

@ask.intent('PokemonBaseHPIntent')
def getPokemonBaseHP(pokemon):
    return generalQuery(pokemon, PokemonBaseHPResponseBuilder)

@ask.intent('PokemonBaseAttackIntent')
def getPokemonBaseAttack(pokemon):
    return generalQuery(pokemon, PokemonBaseAttackResponseBuilder)

@ask.intent('PokemonBaseDefenseIntent')
def getPokemonBaseDefense(pokemon):
    return generalQuery(pokemon, PokemonBaseDefenseResponseBuilder)

@ask.intent('PokemonBaseSpecialIntent')
def getPokemonBaseSpecial(pokemon):
    return generalQuery(pokemon, PokemonBaseSpecialResponseBuilder)

@ask.intent('PokemonBaseSpeedIntent')
def getPokemonBaseSpeed(pokemon):
    return generalQuery(pokemon, PokemonBaseSpeedResponseBuilder)

def generalQuery(key, responseBuilder):
    connection = mysql.connector.connect(user="user", password="password",
                                  host="gen1pokemonapp.cacuxkbfp0fa.us-east-2.rds.amazonaws.com",
                                  database="Gen1PokemonApp")

    cursor = connection.cursor()

    cursor.execute(responseBuilder.query(key))
    response = responseBuilder.buildResponse(cursor, key)

    cursor.close()
    connection.close()

    return response