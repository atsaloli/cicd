# Jenkins Tutorial

## Table of Contents

- [Set up Infrastructure](#set-up-infrastructure)
- [Overview and Architecture](#overview-and-architecture)
- [Definition of Key Terms](#definition-of-key-terms)
- [Building, Testing and Deploying (with hands-on lab)](#building-testing-and-deploying-with-hands-on-lab)
- [Checking Pipeline status with Jenkins Blue Ocean UI](#checking-pipeline-status-with-jenkins-blue-ocean-ui)
- [Troubleshooting](#troubleshooting)


Note: in the following tutorial, `alpha.gitlabtutorial.org` was the hostname of my server.

## Set up Infrastructure

Shut down Gitlab (`sudo gitlab-ctl stop`) and [install Jenkins](https://jenkins.io/download/) (going the Ubuntu/Debian route) 

```bash
gitlab-ctl stop
gitlab-ctl status
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' >>/etc/apt/sources.list
sudo apt-get update
sudo apt-get install jenkins
```

Login on port 8080 (e.g., http://alpha.gitlabtutorial.org:8080/) and follow the on-screen instructions for initial admin login.

Follow the on-screen prompting to install the suggested plugins and to create a user.

Follow the [getting started tour](https://jenkins.io/doc/pipeline/tour/hello-world/) to create your first Pipeline

For example, I created a multi-branch pipeline called "shiny"

My Jenkinsfile (pipeline definition) was:

```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'gcc hello.c -o hello'
            }
        }
        stage('Test'){
            steps {
                sh './hello | grep Hello'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
    }
}

```
When I look at the console output from the last build in "shiny",
http://alpha.gitlabtutorial.org:8080/job/shiny/job/master/lastBuild/console
I see:

```
Branch indexing
 > git rev-parse --is-inside-work-tree # timeout=10
Setting origin to https://gitlab.com/atsaloli/test.git
 > git config remote.origin.url https://gitlab.com/atsaloli/test.git # timeout=10
Fetching origin...
Fetching upstream changes from origin
 > git --version # timeout=10
 > git fetch --tags --progress origin +refs/heads/*:refs/remotes/origin/*
Seen branch in repository origin/master
Seen branch in repository origin/test1
Seen 2 remote branches
Obtained Jenkinsfile from 576939bd2c78c431c735661b9b266832212704d2
[Pipeline] node
Running on master in /var/lib/jenkins/workspace/shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Cloning the remote Git repository
Cloning with configured refspecs honoured and without tags
Cloning repository https://gitlab.com/atsaloli/test.git
 > git init /var/lib/jenkins/workspace/shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA # timeout=10
Fetching upstream changes from https://gitlab.com/atsaloli/test.git
 > git --version # timeout=10
 > git fetch --no-tags --progress https://gitlab.com/atsaloli/test.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url https://gitlab.com/atsaloli/test.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://gitlab.com/atsaloli/test.git # timeout=10
Fetching without tags
Fetching upstream changes from https://gitlab.com/atsaloli/test.git
 > git fetch --no-tags --progress https://gitlab.com/atsaloli/test.git +refs/heads/*:refs/remotes/origin/*
Checking out Revision 576939bd2c78c431c735661b9b266832212704d2 (master)
Commit message: "x"
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 576939bd2c78c431c735661b9b266832212704d2
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] sh
[shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA] Running shell script
+ gcc hello.c -o hello
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] sh
[shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA] Running shell script
+ grep Hello
+ ./hello
Hello world
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] sh
[shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA] Running shell script
+ echo deploy
deploy
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

Note: The creator of Jenkins, Kohsuke Kawaguchi, is Japanese, and in Japan, green is considered a shade of blue -- see https://jenkins.io/blog/2012/03/13/why-does-jenkins-have-blue-balls/ and http://www.atlasobscura.com/articles/japan-green-traffic-lights-blue.  If this bugs you, you can install the ["Green Balls"](https://wiki.jenkins.io/display/JENKINS/Green+Balls) plug-in to turn the blue balls green.

## Overview and Architecture

### Origin

> Jenkins was originally developed as the Hudson project [Sun Microsystems, 2004] ... Around 2007 Hudson became known as a better alternative to CruiseControl and other open-source build-servers. 

-- [Wikipedia entry for Jenkins (software)](https://en.wikipedia.org/wiki/Jenkins_(software))

- In 2011, Jenkins split off from Hudson following a dispute with Oracle

### Architecture

- Jenkins is an open source automation server written in Java. 
- Jenkins is free software (MIT license)

- There is a million plug-ins for Jenkins that can change its behavior or add functionality (1,799 plug-ins available as of Sep 21st, 2017)

## Definition of Key Terms

> **Pipelines** are made up of multiple steps that allow you to build, test and deploy applications. Jenkins Pipeline allows you to compose multiple steps in an easy way that can help you model any sort of automation process.

> Think of a "**step**" like a single command which performs a single action. When a step succeeds it moves onto the next step. When a step fails to execute correctly the Pipeline will fail.

> When all the steps in the Pipeline have successfully completed the Pipeline is considered to have successfully executed. ...
> 

> ... The **sh** step is used to execute a shell command in a Pipeline.
>
> The **agent** directive tells Jenkins where and how to execute the Pipeline, or subset thereof. 
 
-- [Jenkins Guided Tour: Running Multiple Steps](https://jenkins.io/doc/pipeline/tour/running-multiple-steps/)

Jenkins glossary is at 	https://jenkins.io/doc/book/glossary/  Here are few more key definitions excerpted from the glossary:

> **Node**  A machine which is part of the Jenkins environment and capable of executing Pipelines or Projects.
> **Pipeline** A user-defined model of a continuous delivery pipeline
> **Project** A user-configured description of work which Jenkins should perform, such as building a piece of software, etc.
> **Agent** An agent is typically a machine, or container, which connects to a Jenkins master and executes tasks when directed by the master.
> **Master** The central, coordinating process which stores configuration, loads plugins, and renders the various user interfaces for Jenkins.
> **Stage** stage is part of Pipeline, and used for defining a conceptually distinct subset of the entire Pipeline, for example: "Build", "Test", and "Deploy", which is used by many plugins to visualize or present Jenkins Pipeline status/progress.
> **Step** A single task; fundamentally steps tell Jenkins what to do inside of a Pipeline or Project.
> **Workspace** A disposable directory on the file system of a Node where work can be done by a Pipeline or Project. Workspaces are typically left in place after a Build or Pipeline run completes unless specific Workspace cleanup policies have been put in place on the Jenkins Master.



## Building, Testing and Deploying (with hands-on lab)

Continuous Delivery -- asking for human input to proceed

```
pipeline {
    agent any
    stages {
        /* "Build" and "Test" stages omitted */

        stage('Deploy - Staging') {
            steps {
                sh './deploy staging'
                sh './run-smoke-tests'
            }
        }

        stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }

        stage('Deploy - Production') {
            steps {
                sh './deploy production'
            }
        }
    }
}
```

EXERCISE -- create a Jenkins pipeline that will build, test and deploy some piece of code somewhere.

## Checking Pipeline status with Jenkins Blue Ocean UI

Install the "Blue Ocean" plug-in (Manage Jenkins -> Manage Plugins).  Once it installs and Jenkins restarts, you can select "Open Blue Ocean" in the main menu, and you will see a visual representation of your Pipelines and Projects.

## Troubleshooting

- Take a look at the log file on http://jenkinsmaster/log
- Take a look at /var/log/jenkins/jenkins.log
- Install the [monitoring](https://wiki.jenkins.io/display/JENKINS/Monitoring) plug-in and visit http://jenkinsmaster/monitoring

Reference: http://www.scmgalaxy.com/tutorials/jenkins-troubleshooting

# [[Up]](../README.md)
