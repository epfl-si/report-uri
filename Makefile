SHELL := /bin/bash

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

.PHONY: help
help:
	@echo "Main:"
	@echo "  make help             — Display this help"
	@echo "Local development:"
	@echo "  make start            — Launch report-uri"
	@echo "Local production Docker:"
	@echo "  make build            — Build report-uri"
	@echo "  make build-force      — Force build report-uri"
	@echo "  make up               — Brings up report-uri"
	@echo "  make exec             — Enter the container"

.PHONY: start
start:
	@npm start

.PHONY: build
build:
	@docker compose build

.PHONY: build-force
build-force:
	@docker compose build --force-rm --no-cache --pull

.PHONY: up
up:
	@docker compose up

.PHONY: exec
exec:
	@docker exec -it --user root report-uri sh
