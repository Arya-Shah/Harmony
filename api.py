from fastapi import FastAPI
import emojifyimage as em

app = FastAPI()

@app.get('/emotion')
def emotion():
    return {'emotion': em.arya()}
