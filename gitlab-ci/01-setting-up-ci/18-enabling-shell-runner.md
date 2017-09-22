
# Make sure the Shell runner is enabled for the "www" project

In Settings -> Pipelines -> Specific Runners, find your Shell runner and check if it is enabled. It should have a green icon if it is enabled.  If it is not enabled, select "Enable for this project".


# Examine pipeline

If our Pipeline was in "Pending" status before, it should now be in "Passed".

Select "Passed" under Pipeline and then select the job (the green checkmark) and you should see something like:

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Shell executor...
Running on 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Cloning repository...
Cloning into '/home/gitlab-runner/builds/927f01f2/0/root/www'...
Checking out 28e875b6 as master...
$ /bin/echo I am a pretend test suite
I am a pretend test suite
Build succeeded
```
