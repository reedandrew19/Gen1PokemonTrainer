import logging
from flask import Flask
from flask_ask import Ask, statement, question, session
import mysql.connector

app = Flask(__name__)
ask = Ask(app, "/")
logging.getLogger("flask_ask").setLevel(logging.DEBUG)

#pokemonSchema = (name, nationalIDNumber, type1, type2, classification, height, weight, captureRate, evolvedFrom, baseHP, baseAttack, baseDefense, baseSpecial, baseSpeed)
#evolveToSchema = (pokemon, pokemonEvolution, evolutionLevel, otherEvolutionMethod)
#pokedexEntrySchema = (pokemon, game, entry)
#pokemonLocationSchema = (pokemon, game, location)
#resistsSchema = (userType1, userType2, enemyMoveType, multiplier)
#weakToSchema = (userType1, userType2, enemyMoveType, multiplier)
#movesSchema = (name, type, PP, basePower, accuracy, battleEffect, effectRate, TMNumber, HMNumber, speedPriority, pokemonHitInBattle)
#movesFromLevelingSchema = (pokemon, move, level)
#movesFromMachineSchema = (pokemon, move)

@ask.launch
def launchAppWithoutIntent():
    return buildQuestion()

@ask.session_ended
def closeApp():
    return "{}", 200

@ask.intent('PokemonNumberIntent')
def getPokemonNumber(pokemon):

    cnx = mysql.connector.connect(user='nottelling', password='nicetry;)',
                                  host='gen1pokemonapp.cacuxkbfp0fa.us-east-2.rds.amazonaws.com',
                                  database='Gen1PokemonApp')

    cursor = cnx.cursor()
    query = ("SELECT * from Pokemon WHERE Name = '{}'".format(pokemon))
    cursor.execute(query)
    for (name, nationalIDNumber, type1, type2, classification, height, weight, captureRate, evolvedFrom, baseHP,
         baseAttack, baseDefense, baseSpecial, baseSpeed) in cursor:

        return buildQuestion("{} has the ID number {}. ".format(name, nationalIDNumber))

    return buildQuestion("{} isn't a Pokemon. ".format(pokemon))

def buildQuestion(alexaResponse = ""):
    return question(alexaResponse + "Ask me a question about gen 1 Pokemon.")\
        .reprompt("Ask me a question about gen 1 Pokemon.")