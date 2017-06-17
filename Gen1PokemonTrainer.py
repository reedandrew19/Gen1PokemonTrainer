import logging
from flask import Flask
from flask_ask import Ask, statement, question, session

app = Flask(__name__)
ask = Ask(app, "/")
logging.getLogger("flask_ask").setLevel(logging.DEBUG)

@ask.launch
def launchAppWithoutIntent():
    return question("Ask me a question about gen 1 Pokemon.").reprompt("Ask me a question about gen 1 Pokemon.")

@ask.session_ended
def closeApp():
    return "{}", 200

print(launchAppWithoutIntent()._response)
print(closeApp())