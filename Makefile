NODE_VERSION := 10
NODE_IMAGE := node:$(NODE_VERSION)
DOCKER_RUN := docker run --rm -it --init -p 8080:8080 -v $${PWD}:/src/app -w /src/app $(NODE_IMAGE)
NODE := $(DOCKER_RUN) node

clean:
	rm -rf node_modules

run-in-node:
	$(DOCKER_RUN) /bin/bash

npm-install:
	$(DOCKER_RUN) npm install

start:
	$(NODE) server.js

IMAGE := superbrothers/hello-node

image:
	docker build --build-arg NODE_VERSION=$(NODE_VERSION) -t $(IMAGE) .

start-image: image
	docker run --init -p 8080:8080 $(IMAGE)
