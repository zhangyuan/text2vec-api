FROM python:3.9

WORKDIR /app

ARG RUN_AS_USER=app
ARG DOWNLOAD_MODEL=0

COPY requirements.txt requirements-linux-torch.txt /app/

RUN pip install -r requirements-linux-torch.txt
RUN pip install -r requirements.txt

RUN adduser --disabled-password --gecos "" ${RUN_AS_USER}

RUN mkdir -p /huggingface/hub && chown ${RUN_AS_USER}:${RUN_AS_USER} /huggingface/hub
ENV TRANSFORMERS_CACHE=/huggingface/hub

VOLUME [ "/huggingface" ]

COPY build.py /app/
RUN if [ "$DOWNLOAD_MODEL" -eq "1" ]; then python build.py; fi

COPY . /app
USER ${RUN_AS_USER}

CMD ["bash", "-c", "uvicorn main:app --reload -h 0.0.0.0" ]
