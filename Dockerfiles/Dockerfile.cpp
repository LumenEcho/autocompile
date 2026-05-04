FROM gcc:trixie

WORKDIR /usr/local/app

COPY ./dockerTemp ./

RUN g++ dockerCode.cpp -o outFile

RUN chmod 777 outFile

CMD ["./outFile"]