include .env

PROJECTNAME=$(shell basename "$(PWD)")

# Go related variables.
GOBASE=$(shell pwd)
GOPATH=$(GOBASE)/gopath:
GOBIN=$(GOBASE)/bin
GOFILES=$(wildcard *.go)

# Make is verbose in Linux. Make it silent.
MAKEFLAGS += --silent

go-run:
	go run -mod vendor main.go

go-build:
	@GOPATH=$(GOPATH) GOBIN=$(GOBIN) go build -mod vendor -o $(GOBIN)/$(PROJECTNAME) $(GOFILES)
