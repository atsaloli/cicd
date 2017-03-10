# Definition: Runner

A "runner" is an abstraction. It's a way for GitLab to tell the
Go gitlab-ci-multi-runner process on GitLab Runner server what type
of environment to create (e.g. shell, Docker, Vagrant VM, Parallels
VM, etc.) and to communicate the (secret) variables needed to connect
to different APIs, etc.  It also provides a way to control access
at the project level (a runner can be dedicated to a project) or
using tags (runners can be tagged during registration) and you can
then say I want THIS build job to run only on runners with tag X.
