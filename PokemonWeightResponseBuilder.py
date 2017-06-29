from Gen1PokemonTrainer import buildQuestion

class PokemonWeightResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, weight) in cursor:

            return buildQuestion("{} is {}. ".format(name, weight))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, Weight from Pokemon WHERE Name = '{}'".format(pokemon)