# Unregistering runners

You can unregister a runner (to free up resources on the Runner host, or to register a different runner) by name:

```
sudo gitlab-runner list
sudo gitlab-runner unregister --name 'Shell Runner'
```

You can also unregister by runner token (this is different from the
registration token, and you can get it from `gitlab-runner list` or from
"Settings -> CI/CD -> Runner settings -> edit runner".

Run `gitlab-runner help` to see other things you can do with `gitlab-runner`.

# [[Up]](README.md)
