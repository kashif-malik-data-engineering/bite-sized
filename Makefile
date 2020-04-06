
VERSION ?= $(shell git rev-parse --short HEAD)

ifdef GITHUB_REF
GITHUB_REF_VERSION := $(shell [[ $(GITHUB_REF) =~ ^refs/tags/v[0-9.]+$ ]] && echo matched)
ifdef GITHUB_REF_VERSION
VERSION := $(subst refs/tags/v,,$(GITHUB_REF))
endif
endif

.PHONY: version
version:
	@echo $(VERSION)

