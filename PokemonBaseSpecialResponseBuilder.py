from Gen1PokemonTrainer import buildQuestion

class PokemonBaseSpecialResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, baseSpecial) in cursor:

            return buildQuestion("{} has {} base special. ".format(name, baseSpecial))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, BaseSpecial from Pokemon WHERE Name = '{}'".format(pokemon)