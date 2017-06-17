from unittest import TestCase
from flask_ask import Ask, statement, question, session
from Gen1PokemonTrainer import *

class TestAppLaunchWithoutIntent(TestCase):
    def testLaunchApp(self):
        self.assertEquals(launchAppWithoutIntent()._response, question("Ask me a question about gen 1 Pokemon.")
                          .reprompt("Ask me a question about gen 1 Pokemon.")._response)

    def testCloseApp(self):
        self.assertEquals(closeApp(), ('{}', 200))