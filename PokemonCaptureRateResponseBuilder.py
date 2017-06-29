from ConstantFunctions import *

class PokemonCaptureRateResponseBuilder:

    @classmethod
    def buildResponse(cls, cursor, pokemon):
        for (name, captureRate) in cursor:

            return buildQuestion("{} has a capture rate of {}. ".format(name, captureRate))

        return buildQuestion("{} isn't a gen 1 Pokemon. ".format(pokemon))

    @classmethod
    def query(cls, pokemon):
        return "SELECT Name, CaptureRate from Pokemon WHERE Name = '{}'".format(pokemon)