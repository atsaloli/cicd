# Registering our first runner

[Definition of terms: Runner](definition-of-terms--runner.md)


## Register a Shell runner

You can define an "executor" for each runner. The simplest executor is Shell:
the job will run in a shell on the GitLab CI server.


```bash
sudo gitlab-ci-multi-runner register
```

Notes:
- Use main GitLab URL when prompted for coordinator URL.
- Get the registration token from Settings -> CI/CD Pipelines.
- For description, put "Shell runner".
- For executor, use "shell".
- Don't put any tags (we'll learn later how to tag jobs to route them to specific runners).


You can also register runners non-interactively:

```bash
sudo gitlab-runner register --non-interactive \
                            --url https://gitlab.com/ \
                            --registration-token <token> \
			    --executor shell \
                            --description "Shell Runner"
```

You should now see the Shell runner:

```bash
sudo gitlab-runner list
```

You should also see it in the GitLab UI, under `Settings -> CI/CD Pipelines`.
