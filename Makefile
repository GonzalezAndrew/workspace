.PHONY: help
NAME=andrewgonzo/workspace

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TARGETS
# Build the container
build: ## Build the container.
	docker build -t $(NAME) .

build-nc: ## Build the container without caching.
	docker build --no-cache -t $(NAME) .

run: ## Run container and clean up one done.
	docker run -it --rm --privileged -h $(NAME) --name $(NAME) -v /var/run/docker.sock:/var/run/docker.sock $(NAME)

run-ps: ## Run container and keep it presistent.
	docker run -it --privileged -h $(NAME) --name $(NAME) -v /var/run/docker.sock:/var/run/docker.sock $(NAME)

start: ## Start the container and attach to it.
	docker start -ai $(NAME)

up: build run ## Build & run the container.

stop: ## Stop and remove a running container.
	docker stop $(NAME); docker rm $($(NAME)

push:
	docker push $(NAME)