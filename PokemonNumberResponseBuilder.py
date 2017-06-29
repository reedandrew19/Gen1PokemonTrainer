from Gen1PokemonTrainer import buildQuestion

class PokemonNumberResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, nationalIDNumber) in cursor:

            return buildQuestion("{} has the ID number {}. ".format(name, nationalIDNumber))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, NationalIDNumber from Pokemon WHERE Name = '{}'".format(pokemon)