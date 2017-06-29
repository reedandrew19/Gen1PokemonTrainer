from ConstantFunctions import *

class PokemonEvolvedFromResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, evolvedFrom) in cursor:
            if (evolvedFrom is None):
                return buildQuestion("{} doesn't evolve from another Pokemon. "
                                     .format(pokemon))

            return buildQuestion("{} evolves from {}. ".format(name, evolvedFrom))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, EvolvedFrom from Pokemon WHERE Name = '{}'".format(pokemon)