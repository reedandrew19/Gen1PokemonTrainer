from Gen1PokemonTrainer import buildQuestion

class PokemonBaseDefenseResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, baseDefense) in cursor:

            return buildQuestion("{} has {} base defense. ".format(name, baseDefense))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, BaseDefense from Pokemon WHERE Name = '{}'".format(pokemon)