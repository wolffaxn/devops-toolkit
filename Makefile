.PHONY: default
default: build

DOCKER_IMAGE ?= wolffaxn/devops-toolkit

# get version
VERSION = $(strip $(shell cat version.txt))

.PHONY: build
build: docker-build build_output

.PHONY: docker-build
docker-build:
	# build docker image
	docker build -t $(DOCKER_IMAGE):$(VERSION) .

.PHONY: build_output
build_output:
	@echo Successfully built: $(DOCKER_IMAGE):$(VERSION)
