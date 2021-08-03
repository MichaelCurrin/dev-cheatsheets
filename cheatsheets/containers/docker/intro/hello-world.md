---
title: Hello world
description: The most basic use of Docker CLI and way to test that Docker works
---

```sh
$ docker run hello-world
```

Output:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
...

Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

If you installed using `sudo apt install ...` then you might have to run `sudo docker ...`.
