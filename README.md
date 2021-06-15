# Workspace

A Docker container that contains all of the tools I use for development.


## Usage
1. Clone the repo: `git clone https://github.com/GonzalezAndrew/workspace`
2. Change any files under the `/usr/share/workspace` directory
3. Update the `USERNAME` argument in the [`Dockerfile`](Dockerfile)
4. Use the [Makefile](Makefile) to run the Docker commands
```bash
$ make help
help                           This help.
build                          Build the container.
build-nc                       Build the container without caching.
run                            Run container and clean up one done.
run-ps                         Run container and keep it presistent.
start                          Start the container and attach to it.
up                             Build & run the container.
stop                           Stop and remove a running container.
```

