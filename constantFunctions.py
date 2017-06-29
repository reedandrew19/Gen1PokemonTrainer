from flask_ask import question

#pokemonSchema = (name, nationalIDNumber, type1, type2, classification, height, weight, captureRate, evolvedFrom, baseHP, baseAttack, baseDefense, baseSpecial, baseSpeed)
#evolveToSchema = (pokemon, pokemonEvolution, evolutionLevel, otherEvolutionMethod)
#pokedexEntrySchema = (pokemon, game, entry)
#pokemonLocationSchema = (pokemon, game, location)
#resistsSchema = (userType1, userType2, enemyMoveType, multiplier)
#weakToSchema = (userType1, userType2, enemyMoveType, multiplier)
#movesSchema = (name, type, PP, basePower, accuracy, battleEffect, effectRate, TMNumber, HMNumber, speedPriority, pokemonHitInBattle)
#movesFromLevelingSchema = (pokemon, move, level)
#movesFromMachineSchema = (pokemon, move)

def buildQuestion(alexaResponse = ""):
    return question(alexaResponse + "Ask me a question about gen 1 Pokemon.")\
        .reprompt("Ask me a question about gen 1 Pokemon.")