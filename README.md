# Run

Run is a very simple program. You execute the "run.sh" script and give it a simple code file in one of the supported programming languages. It will then create and open a docker container to run the code. Essentially, this is a docker-based programming language agnostic compiler. 

Files for testing are provided in the testFiles directory. 

Command syntax:
./run [code file path]

ALTERNATIVELY:
make run

Supported file types:
- .py
- .sh
- .c
- .cpp