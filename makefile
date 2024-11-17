# Default input parameters
kz ?= kustomize
k ?= kubectl

.SILENT:
MAKEFLAGS += --no-print-directory

.PHONY: template
template:
# make template
	$(kz) build .

.PHONY: build
build:
# make build
	$(MAKE) template | gomplate -c config.yaml

.PHONY: deploy
deploy:
# make deploy
	$(MAKE) build | $(k) apply -f -