# Install

## System packages

If using Debian or Ubuntu, then use `apt` or `apt-get`.

From my [Generic](https://github.com/MichaelCurrin/docker-quickstarts/blob/master/examples/generic/Dockerfile) example.

```Dockerfile
FROM ubuntu

RUN apt update && \
    apt install -q -y git
```

Based on [edx-platform Dockerfile](https://github.com/edx/edx-platform/blob/master/Dockerfile):

```Dockerfile
FROM ubuntu

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        curl \
        g++ \
        gcc \
        git \
        git-core 
```

If using Alphine Linux, use `apk`.


## Install project packages

### Python

See [Python app](https://github.com/MichaelCurrin/docker-quickstarts/tree/master/examples/python_app) quickstart for more info.

```Dockerfile
COPY requirements.txt ./

RUN pip install -r requirements.txt
```

### Node

See [Node app](https://github.com/MichaelCurrin/docker-quickstarts/blob/master/examples/node_app/Dockerfile) quickstart for more info.

```Dockerfile
COPY package*.json ./

RUN npm install
```

