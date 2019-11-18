.PHONY: candidates latest-build latest-charts release auto-release

GITHUB_OWNER=Lowess
GITHUB_REPO=helm-charts

DRONE_CLI_VERSION=1.2-alpine

DRONE_SERVER=https://cloud.drone.io

BUILD=
CHARTS=

LATEST_BUILD=$(shell docker run --rm \
	-e DRONE_SERVER=$(DRONE_SERVER) \
	-e DRONE_TOKEN=${DRONE_TOKEN} \
	drone/cli:$(DRONE_CLI_VERSION) \
	build last $(GITHUB_OWNER)/$(GITHUB_REPO) \
	--branch master \
	--format '{{ .Number }}')
LATEST_CHARTS=$(shell ls -1 charts | tr -s '\n' ',')

candidates:
	docker run --rm \
	-e DRONE_SERVER=$(DRONE_SERVER) \
	-e DRONE_TOKEN=${DRONE_TOKEN} \
	drone/cli:$(DRONE_CLI_VERSION) \
	build ls $(GITHUB_OWNER)/$(GITHUB_REPO)

check-release:
ifndef BUILD
	$(error Please specify a BUILD=<BUILD_ID>)
endif
ifndef CHARTS
	$(error Please specify a CSV string of Charts to release CHARTS=<app1,app2>)
endif

release: check-release
	docker run --rm \
	-e DRONE_SERVER=$(DRONE_SERVER) \
	-e DRONE_TOKEN=${DRONE_TOKEN} \
	drone/cli:$(DRONE_CLI_VERSION) \
	build promote $(GITHUB_OWNER)/$(GITHUB_REPO) \
	$(BUILD) \
	production \
	--param CHARTS=$(CHARTS)

auto-release:
	docker run --rm \
	-e DRONE_SERVER=$(DRONE_SERVER) \
	-e DRONE_TOKEN=${DRONE_TOKEN} \
	drone/cli:$(DRONE_CLI_VERSION) \
	build promote $(GITHUB_OWNER)/$(GITHUB_REPO) \
	$(LATEST_BUILD) \
	production \
	--param CHARTS="$(LATEST_CHARTS)"
