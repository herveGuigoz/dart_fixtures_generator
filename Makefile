.PHONY: get
get: ## update dependencies
	dart pub get

.PHONY: build
build: ## run build_runner build
	dart run build_runner build --delete-conflicting-outputs

.PHONY: run
run: ## generate fixtures
	dart bin/main.dart

.PHONY: git-clean
git-clean: # Clean up git
	git clean -xffd

.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
