from Gen1PokemonTrainer import buildQuestion

class PokemonBaseAttackResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, baseAttack) in cursor:

            return buildQuestion("{} has {} base attack. ".format(name, baseAttack))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, BaseAttack from Pokemon WHERE Name = '{}'".format(pokemon)