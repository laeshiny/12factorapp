
GOPATH = ${PWD}
export GOPATH

BINARY = "api-server"

all: build

get:
	go get github.com/gin-gonic/gin

build:
	go build -o bin/$(BINARY) main

