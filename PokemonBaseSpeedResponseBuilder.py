from Gen1PokemonTrainer import buildQuestion

class PokemonBaseSpeedResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, baseSpeed) in cursor:

            return buildQuestion("{} has {} base speed. ".format(name, baseSpeed))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, BaseSpeed from Pokemon WHERE Name = '{}'".format(pokemon)