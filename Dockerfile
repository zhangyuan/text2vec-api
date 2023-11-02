FROM python:3.9

WORKDIR /app

ARG RUN_AS_USER=app

COPY requirements.txt requirements-linux-torch.txt /app/

RUN pip install -r requirements-linux-torch.txt
RUN pip install -r requirements.txt


COPY build.py /app/
RUN python build.py

COPY . /app

RUN adduser --disabled-password --gecos "" ${RUN_AS_USER}

VOLUME [ "/home/${RUN_AS_USER}/.cache/huggingface" ]

USER ${RUN_AS_USER}

CMD ["bash", "-c", "uvicorn main:app --reload -h 0.0.0.0" ]
