from Gen1PokemonTrainer import buildQuestion

class PokemonBaseHPResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, baseHP) in cursor:

            return buildQuestion("{} has {} base HP. ".format(name, baseHP))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, BaseHP from Pokemon WHERE Name = '{}'".format(pokemon)