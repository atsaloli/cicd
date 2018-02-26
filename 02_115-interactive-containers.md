# Interactive access to containers

There is no substitute for poking around, so if you need to get into a Docker container, run it with "interactive" and "tty" options:

```
docker run -it <image> /bin/bash
```
---

# Interactive access to containers

Pro tip: to keep a container running so you can login and poke around, add a sleep loop command to your `script`:

```
test_it:
  script: 
    - /bin/echo I am a pretend test suite. I passed!
    - while true; do sleep 1; date; done
```
Now you can run `docker ps` to get the container id, and start an interactive session with `docker exec -it <id> /bin/bash`.
