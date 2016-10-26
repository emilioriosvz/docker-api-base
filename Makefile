SHELL := /bin/bash

DOCKER_FILE := docker-compose.yml
COMPOSE := docker-compose -f $(DOCKER_FILE)
SERVICE_COMMANDS := pull build down kill rm ps stop events unpause restart port pause create
COMPOSE_COMMANDS := config version $(SERVICE_COMMANDS)
SERVICES := $(shell $(COMPOSE) config --services)

.PHONY: $(SERVICES)

up:
	$(COMPOSE) up -d

logs:
	$(COMPOSE) logs -f

remove:
	$(COMPOSE) stop
	$(COMPOSE) rm -f

reboot:
	$(COMPOSE) stop
	$(COMPOSE) up -d

start:
	$(COMPOSE) up -d --build

$(SERVICES):
	make $@/up

$(COMPOSE_COMMANDS):
	$(COMPOSE) "$@"

# Start a bash shell in the given container
$(foreach service,$(SERVICES),$(service)/ssh):
	$(COMPOSE) exec $(word 1, $(subst /, ,$@)) bash
