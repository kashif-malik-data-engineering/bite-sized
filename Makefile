SHELL := /bin/bash
VERSION ?= $(shell git rev-parse --short HEAD)
GIT_TAG_VERSION := $(shell [[ $(GIT_TAG_LATEST) =~ ^v[0-9.]+$$ ]] && echo matched)
ifdef GIT_TAG_VERSION
VERSION := $(subst v,,$(GIT_TAG_LATEST))
endif
endif

.PHONY: version
version:
	@echo $(VERSION) $(GIT_TAG_LATEST) $(GIT_TAG_VERSION)

