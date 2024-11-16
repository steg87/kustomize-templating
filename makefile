# Default input parameters
kz ?= kustomize
k ?= kubectl

.SILENT:
MAKEFLAGS += --no-print-directory

.PHONY: build
build:
# make build
	$(kz) build .

.PHONY: deploy
deploy:
# make deploy
	$(MAKE) build | $(k) apply -f -