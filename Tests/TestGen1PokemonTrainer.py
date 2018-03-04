from unittest import TestCase
from flask_ask import Ask, statement, question, session
from Gen1PokemonTrainer import *
from ConstantFunctions import *

class TestGen1PokemonTrainer(TestCase):
    def testLaunchApp(self):
        self.assertEquals(launchAppWithoutIntent()._response, buildQuestion()._response)

    def testCloseApp(self):
        self.assertEquals(closeApp(), ('{}', 200))

    def testGetPokemonNumberPass(self):
        self.assertEquals(getPokemonNumber("bulbasaur")._response,
                          buildQuestion("Bulbasaur has the ID number 1. ")._response)

    def testGetPokemonNumberFail(self):
        self.assertEquals(getPokemonNumber("bob")._response,
                          buildQuestion("bob isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonTypeTwoTypesPass(self):
        self.assertEquals(getPokemonType("ivysaur")._response,
                          buildQuestion("Ivysaur is a Grass and Poison type Pokemon. ")._response)

    def testGetPokemonTypeOneTypePass(self):
        self.assertEquals(getPokemonType("Mew")._response,
                          buildQuestion("Mew is a Psychic type Pokemon. ")._response)

    def testGetPokemonTypeFail(self):
        self.assertEquals(getPokemonType("billy")._response,
                          buildQuestion("billy isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonClassificationPass(self):
        self.assertEquals(getPokemonClassification("Mew")._response,
                          buildQuestion("Mew is the New Species Pokemon. ")._response)

    def testGetPokemonClassificationFail(self):
        self.assertEquals(getPokemonClassification("guy")._response,
                          buildQuestion("guy isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonHeightPass(self):
        self.assertEquals(getPokemonHeight("Mew")._response,
                          buildQuestion("Mew is 1'04\". ")._response)

    def testGetPokemonHeightFail(self):
        self.assertEquals(getPokemonHeight("Joe")._response,
                          buildQuestion("Joe isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonWeightPass(self):
        self.assertEquals(getPokemonWeight("Mew")._response,
                          buildQuestion("Mew is 8.8 lbs. ")._response)

    def testGetPokemonWeightFail(self):
        self.assertEquals(getPokemonWeight("bob")._response,
                          buildQuestion("bob isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonCaptureRatePass(self):
        self.assertEquals(getPokemonCaptureRate("Mew")._response,
                          buildQuestion("Mew has a capture rate of 45. ")._response)

    def testGetPokemonCaptureRateFail(self):
        self.assertEquals(getPokemonCaptureRate("chicken")._response,
                          buildQuestion("chicken isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonEvolvedFromNotNullPass(self):
        self.assertEquals(getPokemonEvolvedFrom("Venusaur")._response,
                          buildQuestion("Venusaur evolves from Ivysaur. ")._response)

    def testGetPokemonEvolvedFromNull(self):
        self.assertEquals(getPokemonEvolvedFrom("Bulbasaur")._response,
                          buildQuestion("Bulbasaur doesn't evolve from"
                                        " another Pokemon. ")._response)

    def testGetPokemonEvolvedFromFail(self):
        self.assertEquals(getPokemonEvolvedFrom("boi")._response,
                          buildQuestion("boi isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonEvolutionSingle(self):
        self.assertEquals(getPokemonEvolution("Bulbasaur")._response,
                          buildQuestion("Bulbasaur evolves into Ivysaur. ")._response)

    def testGetPokemonEvolutionEevee(self):
        self.maxDiff = None
        self.assertEquals(getPokemonEvolution("Eevee")._response,
                          buildQuestion("Eevee evolves into Flareon,"
                                        " Jolteon, and Vaporeon. ")._response)

    def testGetPokemonEvolutionNull(self):
        self.assertEquals(getPokemonEvolution("Venusaur")._response,
                          buildQuestion("Venusaur doesn't have an evolution "
                                        "in gen 1. ")._response)

    def testGetPokemonEvolutionFail(self):
        self.assertEquals(getPokemonEvolution("evolve")._response,
                          buildQuestion("evolve isn't a"
                                        " gen 1 Pokemon. ")._response)

    def testGetPokemonBaseHPPass(self):
        self.assertEquals(getPokemonBaseHP("venusaur")._response,
                          buildQuestion("Venusaur has 80 base HP. ")._response)

    def testGetPokemonBaseHPFail(self):
        self.assertEquals(getPokemonBaseHP("me")._response,
                          buildQuestion("me isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonBaseAttackPass(self):
        self.assertEquals(getPokemonBaseAttack("venusaur")._response,
                          buildQuestion("Venusaur has 82 base attack. ")._response)

    def testGetPokemonBaseAttackFail(self):
        self.assertEquals(getPokemonBaseAttack("greg")._response,
                          buildQuestion("greg isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonBaseDefensePass(self):
        self.assertEquals(getPokemonBaseDefense("Venusaur")._response,
                          buildQuestion("Venusaur has 83 base defense. ")._response)

    def testGetPokemonBaseDefenseFail(self):
        self.assertEquals(getPokemonBaseDefense("hi")._response,
                          buildQuestion("hi isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonBaseSpecialPass(self):
        self.assertEquals(getPokemonBaseSpecial("Venusaur")._response,
                          buildQuestion("Venusaur has 100 base special. ")._response)

    def testGetPokemonBaseSpecialFail(self):
        self.assertEquals(getPokemonBaseSpecial("Flash")._response,
                          buildQuestion("Flash isn't a gen 1 Pokemon. ")._response)

    def testGetPokemonBaseSpeedPass(self):
        self.assertEquals(getPokemonBaseSpeed("Venusaur")._response,
                          buildQuestion("Venusaur has 80 base speed. ")._response)

    def testGetPokemonBaseSpeedFail(self):
        self.assertEquals(getPokemonBaseSpeed("nope")._response,
                          buildQuestion("nope isn't a gen 1 Pokemon. ")._response)

    def testBuildQuestionEmpty(self):
        self.assertEquals(buildQuestion()._response,
                          question("Ask me a question about gen 1 Pokemon.")
                          .reprompt("Ask me a question about gen 1 Pokemon.")._response)

    def testBuildQuestion(self):
        self.assertEquals(buildQuestion("yo dude, what's up?")._response,
                          question("yo dude, what's up?Ask me a question about gen 1 Pokemon.")
                          .reprompt("Ask me a question about gen 1 Pokemon.")._response)