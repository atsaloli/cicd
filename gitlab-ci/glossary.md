# Glossary

## GitLab
"GitLab is the leading integrated product for modern software
development. Connecting issue management, version control, code review,
CI, CD, and monitoring into a single, easy-to-install application,
we help teams go faster from idea to production."
-- [about.gitlab.com](https://about.gitlab.com/)

"GitLab unifies issues, code review, CI and CD into a single UI."
-- [about.gitlab.com](https://about.gitlab.com/)

# Definition: Runner

A "runner" is an abstraction. It's a way for GitLab to tell the
Go gitlab-ci-multi-runner process on GitLab Runner Server what type
of environment to create (e.g. shell, Docker, Vagrant VM, Parallels
VM, etc.) and to communicate the (secret) variables needed to connect
to different APIs, etc.  It also provides a way to control access
at the project level (a runner can be dedicated to a project) or
using tags (runners can be tagged during registration) and you can
then say I want THIS build job to run only on runners with tag X.
