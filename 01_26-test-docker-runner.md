
## Setting up your CI/CD infrastructure
# Testing Docker runner

Change your GitLab CI config (`.gitlab-ci.yml`) to display the Linux OS release id, and add the "docker" tag:

```yaml
test_it:
  script: cat /etc/*release
  tags:
  - docker
```

You should see "Alpine Linux" in the job's console log:

(see next slide)

---


```shell_session
Running with gitlab-ci-multi-runner 9.5.1 (96b34cc)
  on Docker runner (1bd8b63d)
Using Docker executor with image alpine ...
Using docker image sha256:15db13e05d8cd647a9c25273cd9ebfc522db1b25fb9928853d21aa91d2ae7295
for predefined container...
Pulling docker image alpine ...
Using docker image alpine ID=sha256:37eec16f187294a31cf56273bd544eaf75f7972e309dce838c38be2dd3aa0a45
for build container...
Running on runner-1bd8b63d-project-1-concurrent-0 via ip-172-31-23-12...
Cloning repository...
Cloning into '/builds/root/www'...
Checking out 906f47e3 as master...
Skipping Git submodules setup
$ cat /etc/*release
3.6.2
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.6.2
PRETTY_NAME="Alpine Linux v3.6"
HOME_URL="http://alpinelinux.org"
BUG_REPORT_URL="http://bugs.alpinelinux.org"
Job succeeded
```
