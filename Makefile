SHELL := /bin/bash

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

.PHONY: help
help:
	@echo "Main:"
	@echo "  make help                  — Display this help"
	@echo "Local development:"
	@echo "  make start                 — Launch report-uri"
	@echo "Local production Docker:"
	@echo "  make set-dockerfile-dev    — Prepare Dockerfile-dev"
	@echo "  make build                 — Build report-uri"
	@echo "  make build-force           — Force build report-uri"
	@echo "  make up                    — Brings up report-uri"
	@echo "  make exec                  — Enter the container"

.PHONY: start
start:
	@npm start

.PHONY: set-dockerfile-dev
set-dockerfile-dev:
	@cp Dockerfile Dockerfile-dev
	@sed -i 's#docker-registry.default.svc:5000/wwp-test/##g' Dockerfile-dev

.PHONY: build
build: set-dockerfile-dev
	@docker compose build

.PHONY: build-force
build-force: set-dockerfile-dev
	@docker compose build --force-rm --no-cache --pull

.PHONY: up
up:
	@docker compose up

.PHONY: exec
exec:
	@docker exec -it --user root report-uri sh
