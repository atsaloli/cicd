# Setup a "www" project and enable CI

We will use this project to explore GitLab CI functionality.

## Add a project

Add a new project "www" 

Add an SSH key so you can commit to this project.

Follow the steps in "Command Line Instructions -> Create a new repository"
to add the first file, `README.md`. (You use the SSH URL, not HTTPS,
so that you can use your SSH key to authorize access without having
to type in your password.)


## Enable CI

On the Project tab of your "www" project, select "Set up CI" to add
the CI config file, `.gitlab-ci.yml`.

The config file format is described in detail in  
[Configuration of your builds with .gitlab-ci.yml - GitLab Documentation](https://docs.gitlab.com/ce/ci/yaml/README.html)

Let's start with a simple "stub" example:


```
test_it:
  script: /bin/echo I am a pretend test suite
```

There are no constraints, so this "test" job will run on every single commit to test the new revision.

If we go to "Pipelines", you should see a pipeline in status "Passed" or "Pending" (waiting for a runner).
