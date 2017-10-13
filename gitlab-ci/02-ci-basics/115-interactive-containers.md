# Interactive access to containers

There is no substitute for poking around, so if you need to get into a Docker container, run it with "interactive" and "tty" switches turned on:

```
docker run -it <image> /bin/bash
```

For example, `docker run -it ubuntu /bin/bash`.

# [[Up]](README.md)
