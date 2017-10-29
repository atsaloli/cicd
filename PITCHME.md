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

Gitlab.com is a public GitLab Server; the GitLab Server software is also available for private (on-prem) use as the Community Edition (open source, free of charge) or the Enterprise Edition (commercial).

---
## Introducing GitLab CI/CD

GitLab comes with an add-on package called Runner Server which provides runners (runners run builds, tests and deploys when new code is committed or integrated).

Runner Server integrates with GitLab Server.

---

## Setting up your CI/CD infrastructure

In this tutorial, you will learn how to install GitLab Server and Runner Server, and will use them to set up a basic CI/CD pipeline.

You will set up two environments: UAT and Prod.

Your basic pipeline will be:

Code --> Automated (unit) testing --> Deploy to UAT --> Acceptance Testing --> Deploy to Prod

- [Setting up your CI/CD infrastructure](01-setting-up-ci/README.md)

---?include=01-setting-up-ci/README.md

## GitLab CI/CD basics

- [GitLab CI/CD basics](02-ci-basics/README.md)

---

## Would you like to know more?

- [Would you like to know more?](bookmarks.md)
