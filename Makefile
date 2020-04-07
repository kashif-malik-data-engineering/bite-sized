
VERSION ?= $(shell git rev-parse --short HEAD)
GITHUB_TAG_LATEST := $(GIT_TAG_NAME)
ifdef GITHUB_TAG_LATEST
GITHUB_REF_VERSION := $(shell [[ $(GITHUB_TAG_LATEST) =~ ^refs/tags/v[0-9.]+$ ]] && echo matched)
ifdef GITHUB_REF_VERSION
VERSION := $(subst refs/tags/v,,$(GITHUB_TAG_LATEST))
endif
endif

.PHONY: version
version:
	@echo $(VERSION) $(GITHUB_TAG_LATEST)

