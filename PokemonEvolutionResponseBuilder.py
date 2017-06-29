from ConstantFunctions import *

class PokemonEvolutionResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (pokemon, pokemonEvolution) in cursor:

            return buildQuestion("{} evolves into {}. ".format(pokemon, pokemonEvolution))

        return buildQuestion("{} either isn't a gen 1 Pokemon or "
                             "doesn't have an evolution in gen 1. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Pokemon, PokemonEvolution from EvolveTo WHERE Pokemon = '{}'".format(pokemon)