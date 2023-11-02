FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements-linux-torch /app/

RUN pip install -r requirements-linux.txt

# RUN python download_model.py

COPY . /app

RUN adduser --disabled-password --gecos "" app

VOLUME [ "/home/text2vec/.cache/huggingface" ]

USER app

CMD ["bash", "-c", "uvicorn main:app --reload -h 0.0.0.0" ]
