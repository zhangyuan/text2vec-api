# text2vec-api

A simple wrapper to text2vec to serve embedding as HTTP API.

## Setup

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


The server also support `POST` request to `/embeddings` with request body like

```json
{
  "input": "hello"
}
```
