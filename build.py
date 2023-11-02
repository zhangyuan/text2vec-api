from text2vec import SentenceModel

EMBEDDING_MODEL_NAME = "shibing624/text2vec-base-multilingual"

if __name__ == "__main__":
    # Download the model
    SentenceModel(EMBEDDING_MODEL_NAME)
