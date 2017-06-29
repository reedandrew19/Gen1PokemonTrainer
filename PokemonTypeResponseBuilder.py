from Gen1PokemonTrainer import buildQuestion

class PokemonTypeResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, type1, type2) in cursor:

            if (type2 is None):
                return buildQuestion("{} is a {} type Pokemon. ".format(name, type1))

            return buildQuestion("{} is a {} and {} type Pokemon. ".format(name, type1, type2))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, Type1, Type2 from Pokemon WHERE Name = '{}'".format(pokemon)