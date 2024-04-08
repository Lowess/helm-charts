.PHONY: help

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

coding-unittest: ## Run helm unittest command for coding challenge
	helm unittest . -f tests/hack/*_test.yaml

coding-template: ## Run helm template command to show helm chart rendering results
	helm template --release-name coding-challenge . -f tests/hack/values/coding.yaml
