FROM python:3.11.15-slim-trixie

WORKDIR /usr/local/app

COPY ./dockerTemp ./

CMD ["python3", "dockerCode.py"]