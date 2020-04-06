
# Use the short commit sha as the version by default
VERSION ?= $(shell git rev-parse --short HEAD)

# if GITHUB_REF exists, it can be one of refs/head/<branch> or refs/tags/<tag>
ifdef GITHUB_REF
# check if it is a tag and matches a version format
GITHUB_REF_VERSION := $(shell [[ $(GITHUB_REF) =~ ^refs/tags/v[0-9.]+$ ]] && echo matched)
ifdef GITHUB_REF_VERSION
# Strip out leading refs/tags/v so we just get X.Y.Z
VERSION := $(subst refs/tags/v,,$(GITHUB_REF))
endif
endif

.PHONY: version
version:
	@echo $(VERSION)

