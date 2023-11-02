from text2vec import SentenceModel

class Encoder:
  def __init__(self) -> None:
    self.model: SentenceModel = None

  def init(self, model_name_or_path: str) -> None:
    # model is saved into ~/.cache/huggingface/hub/
    self.model = SentenceModel(model_name_or_path)

  def encode(self, sentences):
    embeddings = self.model.encode(sentences)
    return embeddings
