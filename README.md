# text2vec-api

A simple wrapper to text2vec to serve embedding as HTTP API.

## Setup

### Run with Docker

```bash
docker run -p 127.0.0.1:9008:8000 zhangyuan/text2vec-api
```

### Run with source code

Install the depedencies:

```bash
pip install -r requirements-mac.txt
# or
# pip install -r requirements-linux.txt
```

Launch the server:

```bash
make serve
```

## How to use the API

### Get request

Visit <http://127.0.0.1:8000/embeddings?input=hello> to get the embeddings. 

### Post request


The server also supports `POST` request to `/embeddings` with request body like

```json
{
  "input": "hello"
}
```
