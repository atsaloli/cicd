# Unregistering runners

Note: If you ever want to unregister a runner (to free up resources on the Runner host),
you can do it by name:

```
gitlab-runner unregister --name 'Shell Runner'
```

You can also unregister by token. The runner token is different from the
registration token, you can get the runner token from `gitlab-runner list` or 
from Settings -> CI/CD Pipelines.

Run `gitlab-runner help` to see other things you can do with `gitlab-runner`.

