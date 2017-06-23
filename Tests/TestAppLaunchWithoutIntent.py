from unittest import TestCase
from flask_ask import Ask, statement, question, session
from Gen1PokemonTrainer import *

class TestAppLaunchWithoutIntent(TestCase):
    def testLaunchApp(self):
        self.assertEquals(launchAppWithoutIntent()._response, buildQuestion()._response)

    def testCloseApp(self):
        self.assertEquals(closeApp(), ('{}', 200))

    def testGetPokemonNumberPass(self):
        self.assertEquals(getPokemonNumber("bulbasaur")._response,
                          buildQuestion("Bulbasaur has the ID number 1. ")._response)

    def testGetPokemonNumberFail(self):
        self.assertEquals(getPokemonNumber("bob")._response,
                          buildQuestion("bob isn't a Pokemon. ")._response)

    def testBuildQuestionEmpty(self):
        self.assertEquals(buildQuestion()._response,
                          question("Ask me a question about gen 1 Pokemon.")
                          .reprompt("Ask me a question about gen 1 Pokemon.")._response)

    def testBuildQuestion(self):
        self.assertEquals(buildQuestion("yo dude, what's up?")._response,
                          question("yo dude, what's up?Ask me a question about gen 1 Pokemon.")
                          .reprompt("Ask me a question about gen 1 Pokemon.")._response)