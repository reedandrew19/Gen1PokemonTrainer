from ConstantFunctions import *

class PokemonClassificationResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, classification) in cursor:

            return buildQuestion("{} is the {}. ".format(name, classification))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, Classification from Pokemon WHERE Name = '{}'".format(pokemon)