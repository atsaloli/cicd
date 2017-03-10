# Test Docker runner

Change your `.gitlab-ci.yml` to display the Linux OS release id:

```yaml
job1:
  script: cat /etc/*release
```

Commit and push your change, and you should see "Alpine Linux" in
the build output:


```shell_session
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Docker executor with image alpine ...
Pulling docker image alpine ...
Running on runner-d26a3d34-project-1-concurrent-0 via 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Fetching changes...
HEAD is now at 9f4fbfa change script
From http://alpha-gitlab.gitlabtutorial.org/root/www
   9f4fbfa..531f43e  master     -> origin/master
Checking out 531f43e1 as master...
$ cat /etc/*release
3.4.4
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.4.4
PRETTY_NAME="Alpine Linux v3.4"
HOME_URL="http://alpinelinux.org"
BUG_REPORT_URL="http://bugs.alpinelinux.org"
Build succeeded
```
