from ConstantFunctions import *

class PokemonHeightResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, height) in cursor:

            return buildQuestion("{} is {}. ".format(name, height))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, Height from Pokemon WHERE Name = '{}'".format(pokemon)