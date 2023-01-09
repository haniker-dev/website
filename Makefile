.PHONY: help
help:
	@echo 'usage: make [target]'
	@echo
	@echo 'List of targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

FORCE: # Used as a way to force certain receipe to always run

build: FORCE ## Build the app locally
	spago build

ci-build: FORCE ## Build the app in CI
	rm -rf dist
	mkdir -p dist 
	cp public/index.html dist/ 
	spago bundle-app --to dist/index.js 
	parcel build dist/index.html 

run-test: ## Run test locally
	spago test

server: ## Run a server locally
	parcel public/index.html --open
