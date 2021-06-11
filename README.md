# Workspace

## Build
```bash 
docker build -t workspace .
```

## Run
Basic usage
```bash
docker run -it --rm workspace
```

If you need to work with Docker
```bash
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock workspace
```


