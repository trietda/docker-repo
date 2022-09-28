# Mapproxy

## How to start

```bash
docker run \
	--name mapproxy \
	-p 8080:8080 \
	-v mapproxy.yaml:/home/mapproxy/config/mapproxy.yaml \
	-d mapproxy
```

## Config

Mount mapproxy config at `/home/mapproxy/config/mapproxy.yaml`

### Process config

Specify these environemnt when run the container

- `PROCESSES`: uwsgi amount of processes
- `THREADS`: uwsgi amount of threads
