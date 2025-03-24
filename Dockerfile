FROM gcc:9.2
COPY . /DockerWorld
WORKDIR /DockerWorld/
RUN apt-get update
RUN apt-get install -y bison flex
RUN lex nomina.l
RUN yacc -d nomina.y
RUN gcc lex.yy.c y.tab.c -o nomina -ll
CMD bash -c "./nomina < nomina.txt"
