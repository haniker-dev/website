.PHONY: help
help:
	@echo 'usage: make [target]'
	@echo
	@echo 'List of targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

FORCE: # Used as a way to force certain receipe to always run

build: FORCE ## Build the app locally
	spago build

rebuild: FORCE ## Rebuild the app locally
	rm -rf output
	spago build

run-test: ## Run test locally
	spago test

server: ## Run a server locally
	tailwindcss --input "" --output public/index.css --watch &
	parcel public/index.html --open

gen-tailwind: FORCE ## Generate Tailwind CSS functions
	../purescript-tailwind-css/cli/purs-tailwind-css-dev.js --output ./gen-src
