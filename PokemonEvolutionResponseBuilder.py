from ConstantFunctions import *

class PokemonEvolutionResponseBuilder:
    response = ""
    prevPokemonInResponse = ""

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        cls.response = pokemon
        cls.prevPokemonInResponse = pokemon

        for (pokemonName, pokemonEvolution) in cursor:
            cls.addToResponse(pokemonEvolution)
            cls.prevPokemonInResponse = pokemonEvolution

        cls.addNotPokemonToResponse()

        return buildQuestion(cls.response)

    @classmethod
    def addToResponse(cls, pokemonEvolution):
        cls.addDoesntExistToResponse(pokemonEvolution)
        cls.addAnotherPokemonToResponse(pokemonEvolution)
        cls.addFirstPokemonToResponse(pokemonEvolution)

    @classmethod
    def addDoesntExistToResponse(cls, pokemonEvolution):
        if pokemonEvolution is None:
            cls.response += " doesn't have an evolution in gen 1. "

    @classmethod
    def addAnotherPokemonToResponse(cls, pokemonEvolution):
        cls.response = cls.response.replace("and {}. ".format(cls.prevPokemonInResponse),
                                            "{}, and {}. ".format(cls.prevPokemonInResponse,
                                                                  pokemonEvolution))
        cls.response = cls.response.replace("{}. ".format(cls.prevPokemonInResponse),
                                            "{}, and {}. ".format(cls.prevPokemonInResponse,
                                                                  pokemonEvolution))

    @classmethod
    def addFirstPokemonToResponse(cls, pokemonEvolution):
        if cls.haventAddedToResponseYet():
            cls.response += " evolves into {}. ".format(pokemonEvolution)

    @classmethod
    def haventAddedToResponseYet(cls):
        return cls.response == cls.prevPokemonInResponse

    @classmethod
    def addNotPokemonToResponse(cls):
        if cls.SQLQueryIsEmpty():
            cls.response += " isn't a gen 1 Pokemon. "

    @classmethod
    def SQLQueryIsEmpty(cls):
        return cls.response == cls.prevPokemonInResponse

    @classmethod
    def query(cls, pokemon):
        return "SELECT Pokemon, EvolvesTo from PokemonEvolutionTree WHERE Pokemon = '{}'".format(pokemon)