FROM gcc:trixie

WORKDIR /usr/local/app

COPY ./dockerTemp ./

CMD ["g++", "dockerCode"]