SHELL := /bin/bash
VERSION ?= $(shell git rev-parse --short HEAD)
GITHUB_TAG_LATEST := $(GIT_TAG_NAME)
ifdef GITHUB_TAG_LATEST
GITHUB_TAG_VERSION := $(shell [[ $(GITHUB_TAG_LATEST) =~ "^v[0-9.]+$" ]] )
ifdef GITHUB_TAG_VERSION
VERSION := $(subst refs/tags/v,,$(GITHUB_TAG_LATEST))
endif
endif

.PHONY: version
version:
	@echo $(VERSION) $(GITHUB_TAG_LATEST)

