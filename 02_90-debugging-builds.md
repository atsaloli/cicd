# Debugging builds

Add debug logging to an individual [job](yaml/job-debug.yaml) or the [whole pipeline](yaml/global-debug.yaml) by using the `CI_DEBUG_TRACE` variable.

Example output with tracing enabled:
```
[0KRunning with gitlab-ci-multi-runner 1.7.1 (f896af7)[0;m
[0;m[0KUsing Shell executor...
[0;m+ set -eo pipefail
+ set +o noclobber
+ eval 'echo "Running on $(hostname)..."
export CI=$'\''true'\''
export CI_DEBUG_TRACE=$'\''false'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_ID=181
export CI_BUILD_REPO=$'\''http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git'\''
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_PROJECT_ID=3
export CI_PROJECT_DIR=$'\''/home/gitlab-runner/builds/86e471c2/0/root/www'\''
export CI_SERVER=$'\''yes'\''
export CI_SERVER_NAME=$'\''GitLab CI'\''
export CI_SERVER_VERSION='\'''\''
export CI_SERVER_REVISION='\'''\''
export GITLAB_CI=$'\''true'\''
export CI=$'\''true'\''
export GITLAB_CI=$'\''true'\''
export CI_BUILD_ID=181
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_NAME=$'\''job1'\''
export CI_BUILD_STAGE=$'\''test'\''
export CI_SERVER_NAME=$'\''GitLab'\''
export CI_SERVER_VERSION=8.13.5
export CI_SERVER_REVISION=$'\''09cedb5'\''
export CI_PROJECT_ID=3
export CI_PROJECT_NAME=$'\''www'\''
export CI_PROJECT_PATH=$'\''root/www'\''
export CI_PROJECT_NAMESPACE=$'\''root'\''
export CI_PROJECT_URL=$'\''http://gitlab.gitlabtutorial.org/root/www'\''
export CI_PIPELINE_ID=108
export CI_RUNNER_ID=11
export CI_RUNNER_DESCRIPTION=$'\''Shell Runner 3'\''
export CI_RUNNER_TAGS='\'''\''
export CI_DEBUG_TRACE=$'\''true'\''
export GITLAB_USER_ID=1
export GITLAB_USER_EMAIL=$'\''admin@example.com'\''
if [[ -d "/home/gitlab-runner/builds/86e471c2/0/root/www/.git" ]]; then
  echo $'\''\x1b[32;1mFetching changes...\x1b[0;m'\''
  $'\''cd'\'' "/home/gitlab-runner/builds/86e471c2/0/root/www"
  $'\''git'\'' "config" "fetch.recurseSubmodules" "false"
  $'\''rm'\'' "-f" ".git/index.lock"
  $'\''git'\'' "clean" "-ffdx"
  $'\''git'\'' "reset" "--hard"
  $'\''git'\'' "remote" "set-url" "origin" "http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git"
  $'\''git'\'' "fetch" "origin" "--prune" "+refs/heads/*:refs/remotes/origin/*" "+refs/tags/*:refs/tags/*"
else
  $'\''mkdir'\'' "-p" "/home/gitlab-runner/builds/86e471c2/0/root/www.tmp/git-template"
  $'\''rm'\'' "-r" "-f" "/home/gitlab-runner/builds/86e471c2/0/root/www"
  $'\''git'\'' "config" "-f" "/home/gitlab-runner/builds/86e471c2/0/root/www.tmp/git-template/config" "fetch.recurseSubmodules" "false"
  echo $'\''\x1b[32;1mCloning repository...\x1b[0;m'\''
  $'\''git'\'' "clone" "--no-checkout" "http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git" "/home/gitlab-runner/builds/86e471c2/0/root/www" "--template" "/home/gitlab-runner/builds/86e471c2/0/root/www.tmp/git-template"
  $'\''cd'\'' "/home/gitlab-runner/builds/86e471c2/0/root/www"
fi
echo $'\''\x1b[32;1mChecking out ec0a2344 as master...\x1b[0;m'\''
$'\''git'\'' "checkout" "-f" "-q" "ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa"
'
+++ hostname
+ :
++ echo 'Running on 52df9575-cb19-4284-9991-61f3eda72c31...'
Running on 52df9575-cb19-4284-9991-61f3eda72c31...
++ export CI=true
++ CI=true
++ export CI_DEBUG_TRACE=false
++ CI_DEBUG_TRACE=false
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ export CI_SERVER=yes
++ CI_SERVER=yes
++ export 'CI_SERVER_NAME=GitLab CI'
++ CI_SERVER_NAME='GitLab CI'
++ export CI_SERVER_VERSION=
++ CI_SERVER_VERSION=
++ export CI_SERVER_REVISION=
++ CI_SERVER_REVISION=
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI=true
++ CI=true
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_NAME=job1
++ CI_BUILD_NAME=job1
++ export CI_BUILD_STAGE=test
++ CI_BUILD_STAGE=test
++ export CI_SERVER_NAME=GitLab
++ CI_SERVER_NAME=GitLab
++ export CI_SERVER_VERSION=8.13.5
++ CI_SERVER_VERSION=8.13.5
++ export CI_SERVER_REVISION=09cedb5
++ CI_SERVER_REVISION=09cedb5
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_NAME=www
++ CI_PROJECT_NAME=www
++ export CI_PROJECT_PATH=root/www
++ CI_PROJECT_PATH=root/www
++ export CI_PROJECT_NAMESPACE=root
++ CI_PROJECT_NAMESPACE=root
++ export CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ export CI_PIPELINE_ID=108
++ CI_PIPELINE_ID=108
++ export CI_RUNNER_ID=11
++ CI_RUNNER_ID=11
++ export 'CI_RUNNER_DESCRIPTION=Shell Runner 3'
++ CI_RUNNER_DESCRIPTION='Shell Runner 3'
++ export CI_RUNNER_TAGS=
++ CI_RUNNER_TAGS=
++ export CI_DEBUG_TRACE=true
++ CI_DEBUG_TRACE=true
++ export GITLAB_USER_ID=1
++ GITLAB_USER_ID=1
++ export GITLAB_USER_EMAIL=admin@example.com
++ GITLAB_USER_EMAIL=admin@example.com
++ [[ -d /home/gitlab-runner/builds/86e471c2/0/root/www/.git ]]
++ echo '[32;1mFetching changes...[0;m'
[32;1mFetching changes...[0;m
++ cd /home/gitlab-runner/builds/86e471c2/0/root/www
++ git config fetch.recurseSubmodules false
++ rm -f .git/index.lock
++ git clean -ffdx
++ git reset --hard
HEAD is now at 27ca77c simplify
++ git remote set-url origin http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ git fetch origin --prune '+refs/heads/*:refs/remotes/origin/*' '+refs/tags/*:refs/tags/*'
From http://gitlab.gitlabtutorial.org/root/www
   27ca77c..ec0a234  master     -> origin/master
++ echo '[32;1mChecking out ec0a2344 as master...[0;m'
[32;1mChecking out ec0a2344 as master...[0;m
++ git checkout -f -q ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
+ set -eo pipefail
+ set +o noclobber
+ eval 'export CI=$'\''true'\''
export CI_DEBUG_TRACE=$'\''false'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_ID=181
export CI_BUILD_REPO=$'\''http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git'\''
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_PROJECT_ID=3
export CI_PROJECT_DIR=$'\''/home/gitlab-runner/builds/86e471c2/0/root/www'\''
export CI_SERVER=$'\''yes'\''
export CI_SERVER_NAME=$'\''GitLab CI'\''
export CI_SERVER_VERSION='\'''\''
export CI_SERVER_REVISION='\'''\''
export GITLAB_CI=$'\''true'\''
export CI=$'\''true'\''
export GITLAB_CI=$'\''true'\''
export CI_BUILD_ID=181
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_NAME=$'\''job1'\''
export CI_BUILD_STAGE=$'\''test'\''
export CI_SERVER_NAME=$'\''GitLab'\''
export CI_SERVER_VERSION=8.13.5
export CI_SERVER_REVISION=$'\''09cedb5'\''
export CI_PROJECT_ID=3
export CI_PROJECT_NAME=$'\''www'\''
export CI_PROJECT_PATH=$'\''root/www'\''
export CI_PROJECT_NAMESPACE=$'\''root'\''
export CI_PROJECT_URL=$'\''http://gitlab.gitlabtutorial.org/root/www'\''
export CI_PIPELINE_ID=108
export CI_RUNNER_ID=11
export CI_RUNNER_DESCRIPTION=$'\''Shell Runner 3'\''
export CI_RUNNER_TAGS='\'''\''
export CI_DEBUG_TRACE=$'\''true'\''
export GITLAB_USER_ID=1
export GITLAB_USER_EMAIL=$'\''admin@example.com'\''
$'\''cd'\'' "/home/gitlab-runner/builds/86e471c2/0/root/www"
echo $'\''\x1b[32;1m$ /bin/true\x1b[0;m'\''
/bin/true
'
++ export CI=true
++ CI=true
++ export CI_DEBUG_TRACE=false
++ CI_DEBUG_TRACE=false
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ export CI_SERVER=yes
++ CI_SERVER=yes
++ export 'CI_SERVER_NAME=GitLab CI'
++ CI_SERVER_NAME='GitLab CI'
++ export CI_SERVER_VERSION=
++ CI_SERVER_VERSION=
++ export CI_SERVER_REVISION=
++ CI_SERVER_REVISION=
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI=true
++ CI=true
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_NAME=job1
++ CI_BUILD_NAME=job1
++ export CI_BUILD_STAGE=test
++ CI_BUILD_STAGE=test
++ export CI_SERVER_NAME=GitLab
+ :
++ CI_SERVER_NAME=GitLab
++ export CI_SERVER_VERSION=8.13.5
++ CI_SERVER_VERSION=8.13.5
++ export CI_SERVER_REVISION=09cedb5
++ CI_SERVER_REVISION=09cedb5
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_NAME=www
++ CI_PROJECT_NAME=www
++ export CI_PROJECT_PATH=root/www
++ CI_PROJECT_PATH=root/www
++ export CI_PROJECT_NAMESPACE=root
++ CI_PROJECT_NAMESPACE=root
++ export CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ export CI_PIPELINE_ID=108
++ CI_PIPELINE_ID=108
++ export CI_RUNNER_ID=11
++ CI_RUNNER_ID=11
++ export 'CI_RUNNER_DESCRIPTION=Shell Runner 3'
++ CI_RUNNER_DESCRIPTION='Shell Runner 3'
++ export CI_RUNNER_TAGS=
++ CI_RUNNER_TAGS=
++ export CI_DEBUG_TRACE=true
++ CI_DEBUG_TRACE=true
++ export GITLAB_USER_ID=1
++ GITLAB_USER_ID=1
++ export GITLAB_USER_EMAIL=admin@example.com
++ GITLAB_USER_EMAIL=admin@example.com
++ cd /home/gitlab-runner/builds/86e471c2/0/root/www
++ echo '[32;1m$ /bin/true[0;m'
[32;1m$ /bin/true[0;m
++ /bin/true
+ set -eo pipefail
+ set +o noclobber
+ eval ''
+ :
+ set -eo pipefail
+ set +o noclobber
+ eval 'export CI=$'\''true'\''
export CI_DEBUG_TRACE=$'\''false'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_ID=181
export CI_BUILD_REPO=$'\''http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git'\''
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_PROJECT_ID=3
export CI_PROJECT_DIR=$'\''/home/gitlab-runner/builds/86e471c2/0/root/www'\''
export CI_SERVER=$'\''yes'\''
export CI_SERVER_NAME=$'\''GitLab CI'\''
export CI_SERVER_VERSION='\'''\''
export CI_SERVER_REVISION='\'''\''
export GITLAB_CI=$'\''true'\''
export CI=$'\''true'\''
export GITLAB_CI=$'\''true'\''
export CI_BUILD_ID=181
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_NAME=$'\''job1'\''
export CI_BUILD_STAGE=$'\''test'\''
export CI_SERVER_NAME=$'\''GitLab'\''
export CI_SERVER_VERSION=8.13.5
export CI_SERVER_REVISION=$'\''09cedb5'\''
export CI_PROJECT_ID=3
export CI_PROJECT_NAME=$'\''www'\''
export CI_PROJECT_PATH=$'\''root/www'\''
export CI_PROJECT_NAMESPACE=$'\''root'\''
export CI_PROJECT_URL=$'\''http://gitlab.gitlabtutorial.org/root/www'\''
export CI_PIPELINE_ID=108
export CI_RUNNER_ID=11
export CI_RUNNER_DESCRIPTION=$'\''Shell Runner 3'\''
export CI_RUNNER_TAGS='\'''\''
export CI_DEBUG_TRACE=$'\''true'\''
export GITLAB_USER_ID=1
export GITLAB_USER_EMAIL=$'\''admin@example.com'\''
$'\''cd'\'' "/home/gitlab-runner/builds/86e471c2/0/root/www"
'
++ export CI=true
++ CI=true
++ export CI_DEBUG_TRACE=false
++ CI_DEBUG_TRACE=false
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ export CI_SERVER=yes
++ CI_SERVER=yes
++ export 'CI_SERVER_NAME=GitLab CI'
++ CI_SERVER_NAME='GitLab CI'
++ export CI_SERVER_VERSION=
+ :
++ CI_SERVER_VERSION=
++ export CI_SERVER_REVISION=
++ CI_SERVER_REVISION=
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI=true
++ CI=true
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_NAME=job1
++ CI_BUILD_NAME=job1
++ export CI_BUILD_STAGE=test
++ CI_BUILD_STAGE=test
++ export CI_SERVER_NAME=GitLab
++ CI_SERVER_NAME=GitLab
++ export CI_SERVER_VERSION=8.13.5
++ CI_SERVER_VERSION=8.13.5
++ export CI_SERVER_REVISION=09cedb5
++ CI_SERVER_REVISION=09cedb5
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_NAME=www
++ CI_PROJECT_NAME=www
++ export CI_PROJECT_PATH=root/www
++ CI_PROJECT_PATH=root/www
++ export CI_PROJECT_NAMESPACE=root
++ CI_PROJECT_NAMESPACE=root
++ export CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ export CI_PIPELINE_ID=108
++ CI_PIPELINE_ID=108
++ export CI_RUNNER_ID=11
++ CI_RUNNER_ID=11
++ export 'CI_RUNNER_DESCRIPTION=Shell Runner 3'
++ CI_RUNNER_DESCRIPTION='Shell Runner 3'
++ export CI_RUNNER_TAGS=
++ CI_RUNNER_TAGS=
++ export CI_DEBUG_TRACE=true
++ CI_DEBUG_TRACE=true
++ export GITLAB_USER_ID=1
++ GITLAB_USER_ID=1
++ export GITLAB_USER_EMAIL=admin@example.com
++ GITLAB_USER_EMAIL=admin@example.com
++ cd /home/gitlab-runner/builds/86e471c2/0/root/www
+ set -eo pipefail
+ set +o noclobber
+ eval 'export CI=$'\''true'\''
export CI_DEBUG_TRACE=$'\''false'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_ID=181
export CI_BUILD_REPO=$'\''http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git'\''
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_PROJECT_ID=3
export CI_PROJECT_DIR=$'\''/home/gitlab-runner/builds/86e471c2/0/root/www'\''
export CI_SERVER=$'\''yes'\''
export CI_SERVER_NAME=$'\''GitLab CI'\''
export CI_SERVER_VERSION='\'''\''
export CI_SERVER_REVISION='\'''\''
export GITLAB_CI=$'\''true'\''
export CI=$'\''true'\''
export GITLAB_CI=$'\''true'\''
export CI_BUILD_ID=181
export CI_BUILD_TOKEN=$'\''xxxxxxxxxxxxxxxxxxxx'\''
export CI_BUILD_REF=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_BEFORE_SHA=$'\''ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa'\''
export CI_BUILD_REF_NAME=$'\''master'\''
export CI_BUILD_NAME=$'\''job1'\''
export CI_BUILD_STAGE=$'\''test'\''
export CI_SERVER_NAME=$'\''GitLab'\''
export CI_SERVER_VERSION=8.13.5
export CI_SERVER_REVISION=$'\''09cedb5'\''
export CI_PROJECT_ID=3
export CI_PROJECT_NAME=$'\''www'\''
export CI_PROJECT_PATH=$'\''root/www'\''
export CI_PROJECT_NAMESPACE=$'\''root'\''
export CI_PROJECT_URL=$'\''http://gitlab.gitlabtutorial.org/root/www'\''
export CI_PIPELINE_ID=108
export CI_RUNNER_ID=11
export CI_RUNNER_DESCRIPTION=$'\''Shell Runner 3'\''
export CI_RUNNER_TAGS='\'''\''
export CI_DEBUG_TRACE=$'\''true'\''
export GITLAB_USER_ID=1
export GITLAB_USER_EMAIL=$'\''admin@example.com'\''
$'\''cd'\'' "/home/gitlab-runner/builds/86e471c2/0/root/www"
'
++ export CI=true
++ CI=true
++ export CI_DEBUG_TRACE=false
++ CI_DEBUG_TRACE=false
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ CI_BUILD_REPO=http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@gitlab.gitlabtutorial.org/root/www.git
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ CI_PROJECT_DIR=/home/gitlab-runner/builds/86e471c2/0/root/www
++ export CI_SERVER=yes
++ CI_SERVER=yes
++ export 'CI_SERVER_NAME=GitLab CI'
++ CI_SERVER_NAME='GitLab CI'
+ :
++ export CI_SERVER_VERSION=
++ CI_SERVER_VERSION=
++ export CI_SERVER_REVISION=
++ CI_SERVER_REVISION=
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI=true
++ CI=true
++ export GITLAB_CI=true
++ GITLAB_CI=true
++ export CI_BUILD_ID=181
++ CI_BUILD_ID=181
++ export CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ CI_BUILD_TOKEN=xxxxxxxxxxxxxxxxxxxx
++ export CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_REF=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ CI_BUILD_BEFORE_SHA=ec0a2344bebb2d95d5203a67245ec0f2ce80b2fa
++ export CI_BUILD_REF_NAME=master
++ CI_BUILD_REF_NAME=master
++ export CI_BUILD_NAME=job1
++ CI_BUILD_NAME=job1
++ export CI_BUILD_STAGE=test
++ CI_BUILD_STAGE=test
++ export CI_SERVER_NAME=GitLab
++ CI_SERVER_NAME=GitLab
++ export CI_SERVER_VERSION=8.13.5
++ CI_SERVER_VERSION=8.13.5
++ export CI_SERVER_REVISION=09cedb5
++ CI_SERVER_REVISION=09cedb5
++ export CI_PROJECT_ID=3
++ CI_PROJECT_ID=3
++ export CI_PROJECT_NAME=www
++ CI_PROJECT_NAME=www
++ export CI_PROJECT_PATH=root/www
++ CI_PROJECT_PATH=root/www
++ export CI_PROJECT_NAMESPACE=root
++ CI_PROJECT_NAMESPACE=root
++ export CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ CI_PROJECT_URL=http://gitlab.gitlabtutorial.org/root/www
++ export CI_PIPELINE_ID=108
++ CI_PIPELINE_ID=108
++ export CI_RUNNER_ID=11
++ CI_RUNNER_ID=11
++ export 'CI_RUNNER_DESCRIPTION=Shell Runner 3'
++ CI_RUNNER_DESCRIPTION='Shell Runner 3'
++ export CI_RUNNER_TAGS=
++ CI_RUNNER_TAGS=
++ export CI_DEBUG_TRACE=true
++ CI_DEBUG_TRACE=true
++ export GITLAB_USER_ID=1
++ GITLAB_USER_ID=1
++ export GITLAB_USER_EMAIL=admin@example.com
++ GITLAB_USER_EMAIL=admin@example.com
++ cd /home/gitlab-runner/builds/86e471c2/0/root/www
[32;1mBuild succeeded
[0;m
```

See [Debug tracing](https://docs.gitlab.com/ce/ci/variables/README.html)

