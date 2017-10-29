# GitLab CI/CD Tutorial

Aleksey Tsalolikhin

aleksey@verticalsysadmin.com

28 October 2017

---

## Table of contents

- Introducing GitLab
- Introducing GitLab CI/CD
- Setting up your CI/CD infrastructure
- GitLab CI/CD basics
- Would you like to know more?

---

## Introducing GitLab

[GitLab](https://about.gitlab.com) is a Web application for working together on code. In addition to a Git data store, it has everything you need for a modern workflow: ticketing system, issue boards, code review, CI/CD, chat and more -- all smoothly integrated in one UI.

GitLab.com is the public service; the software is also available for private (on-prem) use in the Community Edition (open source, free of charge) and the Enterprise Edition (commercial -- ask me for a discount code).

---
## Introducing GitLab CI/CD

GitLab comes with an add-on package called Runner Server which provides runners. Simply put, a runner is what runs the tests. Runners can run build jobs, test jobs, and deploy jobs. Or actually any kind of job! More on this later.

---

## Setting up your CI/CD infrastructure

### Introduction

In this tutorial, you will learn how to install GitLab Server and Runner Server, and will use them to set up a basic CI/CD pipeline.

You will set up two environments: UAT and Prod.

Your basic pipeline will be:

Code --> Automated (unit) testing --> Deploy to UAT --> Acceptance Testing --> Deploy to Prod


---?include=01_05-architecture.md

---?include=01_10-installing-gitlab-server.md

---?include=01_12-setting-up-a-project.md

---?include=01_13-enabling-ci-on-a-project.md

---?include=01_15-installing-docker.md

---?include=01_20-installing-gitlab-ci.md

---?include=01_21-install-build-and-test-tools.md

---

## Registering, enabling and using runners; reading job logs
- [Register a Shell runner](01_22-registering-our-first-runner.md)
- [Unregister the Shell runner](01_24-unregistering-runners.md)
- [Register a Docker runner](01_25-register-and-enable-Docker-runner.md)
- [Test Docker runner](01_26-test-docker-runner.md)
- [Use a different container image](01_27-change-docker-image.md)
- [Runner administration](01_80-runners-admin.md)
- [Paused runner](01_84-paused-runner.md)
- [Pause Docker runner and register Shell runner](01_86-shell-again.md)

## Set up deployment targets: Stage and Prod
- [Set up Stage and Prod web sites](01_91-set-up-prod-and-stg-web-sites.md)
- [Set up trust relationship to deploy to Stage via SSH](01_92-deploy-using-ssh.md)
- [Set up trust relationships to deploy to Stage and Prod via Git](01_93-deploy-via-git.md)


# [[Up]](../README.md)

---

## GitLab CI/CD basics

- [GitLab CI/CD basics](02-ci-basics/README.md)

---

## Would you like to know more?

- [Would you like to know more?](bookmarks.md)
