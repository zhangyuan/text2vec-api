import asyncio
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from embedding import Encoder
import build

app = FastAPI()

origins = [
    "*",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

encoder = Encoder()
encoder.init(build.EMBEDDING_MODEL_NAME)

# Not sure if text2vec.SentenceModel is thread safe, so add a mutex here
encoder_mutex = asyncio.Lock()


class EncodeCommand(BaseModel):
    input: str


@app.get("/")
async def home():
    return {"stauts": "ok"}


@app.post("/embeddings")
async def create_embeddings_via_body(command: EncodeCommand):
    async with encoder_mutex:
        loop = asyncio.get_event_loop()
        data = await loop.run_in_executor(None, encoder.encode, command.input)
        return data.tolist()


@app.get("/embeddings")
async def create_embeddings_via_query(input: str):
    async with encoder_mutex:
        loop = asyncio.get_event_loop()
        data = await loop.run_in_executor(None, encoder.encode, input)
        return data.tolist()
