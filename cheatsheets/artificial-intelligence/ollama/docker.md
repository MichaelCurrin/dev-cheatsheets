---
title: Docker
description: Access Ollama on your host from a container
---

## n8n

See the Ollama [n8n integration](https://docs.ollama.com/integrations/n8n#using-ollama-locally) guide.

Run n8n in Docker with `--add-host=host.docker.internal:host-gateway`.

Or set in docker compose file for a service:

```yaml
extra_hosts:
  - "host.docker.internal:host-gateway"
```

## Make Ollama accessible

## macOS

```sh
launchctl setenv OLLAMA_HOST "0.0.0.0"
```
Then restart Ollama.

## Linux Systemd

```sh
sudo systemctl edit ollama.service
```
Set this:
```toml
[Service]
Environment="OLLAMA_HOST=0.0.0.0"
```
```
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

## Test connection

```sh
docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  ubuntu sh \
  -c "apt-get update && apt-get install -y curl && curl http://host.docker.internal:11434/api/tags"
```
