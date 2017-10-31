# Setting up CI/CD Pipelines

Aleksey Tsalolikhin

aleksey@verticalsysadmin.com

31 Oct 2017

Three tutorials:
- Introduction to CI/CD
- GitLab CI/CD
- Jenkins

---
# Introduction to CI/CD

Aleksey Tsalolikhin

aleksey@verticalsysadmin.com

29 Oct 2017

---

### Table of Contents
- Definition of terms: CI/CD
- Benefits of Continuous Integration
- Origin of Continuous Integration
- Definition of terms: DevOps
- How CI/CD relates to DevOps
- Adoption
- Basic tasks: Build, Test, Deploy
- Bibliography
- P.S. What about Agile?

---

### Definition of terms: CI/CD

#### Continuous Integration (CI)

**Continuous**  
(adjective)  Forming an unbroken whole; without interruption.  
-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/continuous)

**Integration**  
(noun) The action or process of integrating.  
-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/integration)

**Integrate**  
(verb) to unite with something else; to incorporate into a larger unit  
-- [Merriam-Webster](https://www.merriam-webster.com/dictionary/integrate)

---

#### Continuous Integration (CI)

> **Continuous integration (CI)** is the practice of merging all developer working copies to a shared mainline several times a day.  ... The main aim of CI is to prevent integration problems.

-- [Wikipedia entry "Continuous Integration"](https://en.wikipedia.org/wiki/Continuous_integration)

---

#### Continuous Integration (CI)

> **Continuous Integration** is a software development practice where
> members of a team integrate their work frequently, usually each person
> integrates at least daily - leading to multiple integrations per day. Each
> integration is verified by an automated build (including test) to detect
> integration errors as quickly as possible. Many teams find that this
> approach leads to significantly reduced integration problems and allows
> a team to develop cohesive software more rapidly."

-- ["Continuous Integration"](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler (Chief Scientist at ThoughtWorks, vendor of the first commercial Continuous Integration server)



---

#### Continuous Deployment (CD)

> **Continuous Deployment** is closely related to Continuous Integration
> and refers to the release into production of software that passes the
> automated tests.

-- [ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

---

#### Continuous Delivery (CD)

> **Continuous Delivery** is sometimes confused with continuous deployment. Continuous deployment means that every change is automatically deployed to production. Continuous delivery means that the team ensures every change can be deployed to production but may choose not to do it, usually due to business reasons. In order to do continuous deployment one must be doing continuous delivery.

-- [Wikipedia](https://en.wikipedia.org/wiki/Continuous_delivery)

---

#### Pipeline

**Pipeline**  
(noun) A system through which something is conducted, especially as a means of supply: "Farther down the pipeline are three other approaches to vaccine development" (Boston Globe).  
-- [American Heritage Dictionary of the English Language](https://www.ahdictionary.com/word/search.html?q=pipeline)

**Conduct**  
(verb) To serve as a medium for conveying; transmit: "Some metals conduct heat."  
-- [American Heritage Dictionary](https://www.ahdictionary.com/word/search.html?q=conduct)

**Convey**  
(verb) To transport or carry to a place: "Pipes were laid to convey water to the house"  
-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/convey)

---

#### Pipeline

![Release Pipeline](https://i0.wp.com/devops.com/wp-content/uploads/2015/03/cicdcd.png)
Image credit: [“I want to do Continuous Deployment” article on devops.com](https://devops.com/i-want-to-do-continuous-deployment/)


---

#### Testing

This section will define terms pertaining to testing, specifically different types of testing.

---

#### Unit Testing

> **Unit testing** 
> The type of testing where a developer (usually the one who wrote the
> code) proves that a code module (the "unit") meets its requirements.

-- [Free On-Line Dictionary of Computing](https://foldoc.org/unit%20testing)

---

#### Unit Testing

> The primary goal of **unit testing** is to take the smallest piece of testable
> software in the application, isolate it from the remainder of the code,
> and determine whether it behaves exactly as you expect. ...
> Unit testing has proven its value in that a large percentage of defects
> are identified during its use.

-- Microsoft Developer Network


---

#### Unit Testing

> In computer programming, **unit testing** is a software testing method
> by which individual units of source code ...  are tested to determine
> whether they are fit for use.

-- [Wikipedia](https://en.wikipedia.org/wiki/Unit_testing)


---

#### Integration Testing

**Integration Testing**  
A type of testing in which software and/or hardware components are
combined and tested to confirm that they interact according to their
requirements. Integration testing can continue progressively until the
entire system has been integrated.  
-- [Free On-Line Dictionary of Computing](https://foldoc.org/integration%20testing)

---

#### Integration Testing

> **Integration testing** ... is the phase in software testing in
> which individual software modules are combined and tested as a
> group. ... Integration testing takes as its input modules that have been
> unit tested, groups them in larger aggregates, applies tests defined in
> an integration test plan to those aggregates, and delivers as its output
> the integrated system ready for system testing.

-- [Wikipedia](https://en.wikipedia.org/wiki/Integration_testing)

---

#### Functional Testing

> **Functional testing** ... bases its test cases on the specifications of the software component under test. Functions are tested by feeding them input and examining the output, and internal program structure is rarely considered. ...  Functional testing usually describes _what_ the system does.
> 
> Functional testing does not imply that you are testing a function (method) of your module or class. Functional testing tests a slice of functionality of the whole system.

-- [Wikipedia entry, "Functional testing"](https://en.wikipedia.org/wiki/Functional_testing)

---

#### Acceptance Testing

> **Acceptance testing**
>  Acceptance testing is a test conducted to determine if the requirements of a specification or contract are met. ... [It is defined as] formal testing with respect to user needs, requirements, and business processes conducted to determine whether a system satisfies the acceptance criteria and to enable the user, customers or other authorized entity to determine whether or not to accept the system. Acceptance testing is also known as user acceptance testing (UAT), end-user testing, operational acceptance testing (OAT) or field (acceptance) testing.

-- [Wikipedia entry for "Acceptance testing"](https://en.wikipedia.org/wiki/Acceptance_testing#Overview)

---

### Benefits of Continuous Integration

> Releasing software frequently to users is usually a time-consuming and painful process. Continuous Integration and Continuous Delivery (CI/CD) can help organizations ... by automating and streamlining the steps involved in going from an idea ... to the delivered product to the customer.

-- [OpenShift blog, "CI/CD with OpenShift"](https://blog.openshift.com/cicd-with-openshift/)

---

### Benefits of Continuous Integration

#### Integrate at least daily

> Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early. 
>
> By integrating regularly, you can detect errors quickly, and locate them more easily.

-- [ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)


---

### Benefits of Continuous Integration

#### Solve problems quickly

> Because you’re integrating so frequently, there is significantly less back-tracking to discover where things went wrong, so you can spend more time building features.
>
> Continuous Integration is cheap. Not integrating continuously is expensive. If you don’t follow a continuous approach, you’ll have longer periods between integrations. This makes it exponentially more difficult to find and fix problems. Such integration problems can easily knock a project off-schedule, or cause it to fail altogether.

-- [ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

---

### Benefits of Continuous Integration

> Continuous Integration brings multiple benefits to your organization:
> 
> - Say goodbye to long and tense integrations
> - Increase visibility enabling greater communication
> - Catch issues early and nip them in the bud
> - Spend less time debugging and more time adding features
> - Build a solid foundation
> - Stop waiting to find out if your code’s going to work
> - Reduce integration problems allowing you to deliver software more rapidly


-- [ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

---

### Benefits of Continuous Integration

> Continuous Integration doesn’t get rid of bugs, but it does make them dramatically easier to find and remove.

— Martin Fowler, Chief Scientist, ThoughtWorks

---

#### ESSAY

What would be the benefits of Continuous Integration for your organization and how would it impact you personally if your organization practiced it?

---

### Origin of Continuous Integration

In the late 1990's, Don Wells introduced continuous integration at Chrysler:

> Don proposed to the team that they set up an extra computer on an empty desk where all integration would take place. They would integrate and release new code to the repository when ever they wanted without prior permission so long as it ran all the unit tests. Management hated the idea. The team was mixed about it. Management played their trump card by not allowing Don to have an extra computer. So Don simply moved his own computer to the empty desk and told everyone it was the integration station. He wanted to do more pair programming anyway. 
 
(continued on next slide)

---

### Origin of Continuous Integration

> The real prize in that change was what came to be known as collective ownership. The entire team owns the entire code base. The entire team is responsible for developing and extending the system design. The team worked together cooperatively at a much faster pace than anyone expected.  Don  has  some  rough  estimates  and believes the team was going six and a half times faster.

-- [www.agile-process.org web page "Your host:  Don Wells"](http://www.agile-process.org/don.html)

---

### Origin of Continuous Integration

Martin Fowler was involved in the work at Chrysler.

> This was my first chance to see Continuous Integration in action with a meaningful amount of unit tests. It showed me what was possible and gave me an inspiration that led me for many years.

-- [Martin Fowler's article "Continuous Integration"](https://martinfowler.com/articles/continuousIntegration.html)

---

### Origin of Continuous Integration

> ThoughtWorks created the first known Continuous Integration server, Cruise, in 2001. This Java-based tool was later open-sourced and renamed CruiseControl. 
> 
> Around 2007, after finding CruiseControl limiting, [Jez] Humble worked alongside a ThoughtWorks team in Beijing to create the [ThoughtWorks] tool that later became Go (now styled GoCD). 
> 
> In 2010, Humble and ex-ThoughtWorker Dave Farley published [the first book on continuous delivery](http://amzn.to/1QBJM7k).

-- [Wikipedia entry, "ThoughtWorks"](https://en.wikipedia.org/wiki/ThoughtWorks#Continuous_integration_and_continuous_delivery)

---

### Definition of terms: DevOps

> DevOps is... an umbrella concept that refers to anything that smoothes out the interaction between development and operations.

-- ["What is Devops?", Damon Edwards](http://dev2ops.org/2010/02/what-is-devops/)

---

#### DevOps

> The term “DevOps” typically refers to the emerging professional movement that advocates a collaborative working relationship between Development and IT Operations, resulting in the fast flow of planned work (i.e., high deploy rates), while simultaneously increasing the reliability, stability, resilience and security of the production environment.  

-- ["Top 11 Things You Need to Know about DevOps", Gene Kim's ITRevolution.com](http://images.itrevolution.com/documents/Top_11_DevOps_01_2015.pdf)
 

---

#### DevOps

> Today, DevOps is an understood set of practices and cultural values that has been proven to help organizations of all sizes improve their software release cycles, software quality, security, and ability to get rapid feedback on product development.

-- [2017 State of DevOps Report](https://puppet.com/resources/whitepaper/state-of-devops-report)

---

#### DevOps
> Currently, **DevOps** is more like a philosophical movement ...  At this early stage we’re in, DevOps is more like a vibrant community of practitioners who are interesting in replicating the performance outcomes and culture as exemplified in the seminal John Allspaw/Tim Hammond 2009 Velocity presentation about doing “ten deploys a day” at Flickr.

-- ["DevOps Cookbook" article by Gene Kim](http://www.realgenekim.me/devops-cookbook/)

---

#### DevOps

John Willis, co-author of "The DevOps Handbook", with Los Angeles chapter of LOPSA
![John Willis with LA chapter of LOPSA](https://secure.meetupstatic.com/photos/event/d/9/b/highres_456903483.jpeg)

---

### How CI/CD relates to DevOps

> Continuous delivery and DevOps have common goals and are often used in conjunction, but there are subtle differences.
>
> While continuous delivery is focused on automating the processes in software delivery, DevOps also focuses on the organization change to support great collaboration between the many functions involved.

-- [Wikipedia entry for "DevOps"](https://en.wikipedia.org/wiki/DevOps#Continuous_delivery)

---

### How CI/CD relates to DevOps

#### Automating deployments

> The **deployment pipeline**, first defined by Jez Humble and David Farley in their book ["Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation"](http://amzn.to/1QBJM7k), ensures that all code checked in to version control is automatically built and tested in a production-like environment. By doing this, we find any build, test or integration errors as soon as a change is introduced, enabling us to fix them immediately. Done correctly, this allows us to always be assured that we are in a deployable and shippable state.
>
> To achieve this, we must create automated build and test processes that run in dedicated environments.

-- "The DevOps Handbook", Chapter 10 "Enable Fast and Reliable Automated Testing"
---

### Adoption

> Automation is a key differentiator for organizations. ... Automation is a huge boon to organizations.
High performers automate significantly more of their configuration management, testing, deployments and
change approval processes than other teams. The result is more time for innovation and a faster feedback cycle.
> ...
> DevOps teams increased from 16% in 2014 to 19% in 2015 to 22% in 2016 to 27% in 2017.

-- [2017 State of DevOps Report](https://puppet.com/resources/whitepaper/state-of-devops-report)

---

<!-- http://www.verticalsysadmin.com/img/2017-state-of-devops-report-puppet-dora.png -->

> We found that the following all positively affect continuous delivery: comprehensive use of version control; continuous integration and trunk-based development; integrating security into software delivery work; and the use of test and deployment automation. Of these, test automation is the biggest contributor. 

-- [2017 State of DevOps Report](https://puppet.com/resources/whitepaper/state-of-devops-report)

---

> The biggest contributor to continuous delivery — bigger even than test and deployment automation — is whether a team can do all of the following:
> - Make large-scale changes to the design of its system without permission from someone outside the team.
> - Make large-scale changes to the design of its system without depending on other teams to make changes in their own systems, or creating significant work for other teams.
> - Complete its work without needing fine-grained communication and coordination with people outside the team. For example, not having to check 12 Google calendars to get feedback.
> - Deploy and release its product or service on demand, independently of other services the product or service depends upon.
> - Do most of its testing on demand, without requiring an integrated test environment.
> - Perform deployments during normal business hours with negligible downtime.

-- [2017 State of DevOps Report](https://puppet.com/resources/whitepaper/state-of-devops-report)

---

### Basic tasks: Build, Test, Deploy

<!--
![DevOps Venn Diagram from Chinese Wikipedia](https://upload.wikimedia.org/wikipedia/commons/b/b5/Devops.svg)
Image credit: Chinese Wikipedia entry, "DevOps"
-->


#### from Idea to Production

Idea --> Code --> Build --> Test --> Deploy


---

#### Idea

Example:

"Let's write a 'hello world' program!"


---

#### Code

Example:


```shell_session
$ cat hello.c
# include <stdio.h>
main()
{
    printf("Hello World");
}
$
```

---

#### Build

**Build**  
(verb) _Computing_ Compile (a program, database, index, etc.).  
(noun) _Computing_ A compiled version of a program; the process of compiling a program.

-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/build)


**Compile**  
_Computing_ (of a computer) convert (a program) into a machine-code or lower-level form in which the program can be executed.

-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/compile)

Example:

```shell_session
$ gcc -o hello hello.c
$
```

---

#### Test

**Test**   
(noun) a process designed to find out whether something such as a machine or weapon works correctly or whether a product is satisfactory  

-- [Macmillan Dictionary](http://www.macmillandictionary.com/dictionary/american/test_1)

---

Example 1 - testing with Make - a successful test:

```shell_session
$ cat Makefile
test:
        ./hello > output.txt
        diff -q correct.txt output.txt

$ cat correct.txt
Hello World
$ make test
./hello > output.txt
diff -q correct.txt output.txt

$

```
---

Example 1b - induce failure:

```shell_session
$ date > correct.txt

$ make test
./hello > output.txt
diff -q correct.txt output.txt
Files correct.txt and output.txt differ
make: *** [Makefile:3: test] Error 1

$
```
---

Example 2 - Testing with [Bash Automated Testing System (bats)](https://github.com/sstephenson/bats)


```shell_session
$ cat hello_test.bats
#!/usr/bin/env bats

@test "'hello' outputs 'hello world'" {
  result="$(./hello)"
  [ "$result" == "Hello World" ]
}
$ bats hello_test.bats
 ✓ 'hello' outputs 'hello world' 

1 test, 0 failures
$
```

---

#### Deploy
**Deploy**  
(verb) To place (people or other resources) into a position so as to be ready to for action or use.  

-- [Webster's 1913 Dictionary](http://www.webster-dictionary.org/definition/deploy)

**Deploy**  
(verb) Bring into effective action; utilize.  
"They are not always able to deploy this skill."

-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/deploy)

---

#### Deploy

Example: deploying on the local host:

```shell_session
$ sudo cp hello /usr/local/bin/hello
$
```

Example: deploying to a remote environment:

```shell_session
$ scp hello root@production:/usr/local/bin/hello
$
```

---

### Bibliography
- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), article by Martin Fowler
- [Continuous Deployment at IMVU: Doing the impossible fifty times a day](http://timothyfitz.com/2009/02/10/continuous-deployment-at-imvu-doing-the-impossible-fifty-times-a-day/), article by Timothy Fitz
- [Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation](http://amzn.to/1QBJM7k) book by Jez Humble and David Farley
- [Continuous Integration: Improving Software Quality and Reducing Risk](https://www.amazon.com/Continuous-Integration-Improving-Software-Reducing/dp/0321336380) book by Paul M. Duvall, et al.
- [10+ Deploys Per Day: Dev and Ops Cooperation at Flickr](https://www.youtube.com/watch?v=LdOe18KhtT4&t=14s) video, 2009 Velocity presentation
- [The Phoenix Project: A Novel About IT, DevOps, and Helping Your Business Win](https://www.amazon.com/Phoenix-Project-DevOps-Helping-Business/dp/0988262592) by Gene Kim, et al.
- [The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations](https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations-ebook/dp/B01M9ASFQ3) by Gene Kim, et al.

---

### P.S. What about Agile?

A common question I get is, how does CI/CD relate to Agile?

[Agile software development](https://en.wikipedia.org/wiki/Agile_software_development) values early delivery, short feedback loops and continuous improvement; the principles and technology of CI/CD enable that.
---
# GitLab CI/CD Tutorial

Aleksey Tsalolikhin

aleksey@verticalsysadmin.com

29 October 2017

---

## Table of contents

- Introduction
- Setting up your CI/CD infrastructure
- Configuring CI/CD pipelines
- Troubleshooting
- Would you like to know more?

---

## Introduction

### GitLab

[GitLab](https://about.gitlab.com) is a Web application for working together on code. In addition to a Git data store, it has everything you need for a modern workflow: ticketing system, issue boards, code review, CI/CD, chat and more -- all smoothly integrated in one UI.

GitLab.com is the public service; the software is also available for private (on-prem) use in the Community Edition (open source, free of charge) and the Enterprise Edition (commercial -- ask me for a discount code).

---
## Introduction

### GitLab CI/CD (Runner Server)

GitLab comes with an add-on package called Runner Server which provides runners. Simply put, a runner is what runs the tests. Runners can run build jobs, test jobs, and deploy jobs. Or actually any kind of job! Runner Server works with GitLab through GitLab Server's API.

---?include=01_05-architecture.md

---

## Introduction

### Lab exercise

In this tutorial, you will set up:

- GitLab Server 
- Runner Server
- UAT environment
- Production environment

Using these building blocks, you will set up a **CI/CD pipeline**:

![lab pipeline](img/lab-pipeline.png)

You will then re-use the UAT and Production environments in the Jenkins tutorial.

---

## Introduction

### Lab exercise

The pipeline could be fully automated:

![lab pipeline](img/lab-pipeline-full-auto.png)


---?include=01_10-installing-gitlab-server.md

---?include=01_12-setting-up-a-project.md

---?include=01_13-enabling-ci-on-a-project.md

---?include=01_15-installing-docker.md

---?include=01_20-installing-gitlab-ci.md

<!-- setting up runners -->

---?include=01_22-registering-our-first-runner.md

---?include=01_25-register-and-enable-Docker-runner.md

---?include=01_26-test-docker-runner.md

---?include=01_27-change-docker-image.md

<!-- setting up UAT and Prod environments -->
---?include=01_91-set-up-prod-and-stg-web-sites.md
---?include=01_92-deploy-using-ssh.md
---?include=01_93-deploy-via-git.md


---
## Configuring CI/CD pipelines
### Introduction

Now our infrastructure is set up. We have:

- GitLab Server (for our GitLab Web application)
- Runner Server (to provider runners, to run CI builds and tests, and CD jobs)
- a mock Stage environment (for User Acceptance Testing)
- a mock Prod environment

Trust relationships:
- `gitlab-runner` user can SSH to Stage environment
- `gitlab-runner` user can push to Git
- Prod environment can pull from Git

This next section will deal with configuring CI/CD pipelines.

It's purpose is to get you more familiar with GitLab's CI syntax and capabilities.

First, let's go over some key definitions.

---?include=02_00-key-definitions.md

<!-- Continuous Integration -->

---?include=02_01-single-test-job.md
---?include=02_02-simple-3-stage-shell-pipeline.md
---?include=02_03-simple-3-stage-docker-pipeline.md
---?include=02_05-parallel-jobs.md
---?include=02_30-custom-stages.md
---?include=02_40-testing-with-phpunit.md

<!-- Continuous Delivery -->
---?include=02_42-deploying-to-stage-via-ssh.md
---?include=02_44-set-up-git-pulls-from-mock-envs.md
---?include=02_45-deploying-via-git.md
---?include=02_50-manual-deploy-to-production.md

---
## Continuous Deployment

This next section deals with Continuous Deployment (automated end-to-end).

---?include=02_55-continuous-deployment.md

<!-- Troubleshooting -->

---
## Troubleshooting
This next section deals with troubleshooting.

---?include=02_90-debugging-builds.md
---?include=02_100-increasing-loglevel.md
---?include=02_110-gitlab-logs.md
---?include=02_115-interactive-containers.md
---?include=02_118-env-vars.md
---?include=02_120-debugging.md

---?include=bookmarks.md

---
# Jenkins Tutorial

Aleksey Tsalolikhin

aleksey@verticalsysadmin.com

31 Oct 2017

---

## Table of Contents

- Overview and Architecture
- Jenkins Terms
- Installing and Configuring Jenkings
- Configuring Pipelines
- Checking Pipeline status with Jenkins Blue Ocean UI
- Troubleshooting

---
## Overview and Architecture

### Origin

> Jenkins was originally developed as the Hudson project [Sun Microsystems, 2004] ... Around 2007 Hudson became known as a better alternative to CruiseControl and other open-source build-servers. 

-- [Wikipedia entry for Jenkins (software)](https://en.wikipedia.org/wiki/Jenkins_(software))

In 2011, Jenkins split off from Hudson following a dispute with Oracle.

---
### Architecture

- Jenkins is an open source automation server written in Java. 
- Jenkins is free software (MIT license)
- There is a million plug-ins for Jenkins that can change its behavior or add functionality (1,799 plug-ins available as of Sep 21st, 2017)

---
## Jenkins Terms

> **Pipelines** are made up of multiple steps that allow you to build, test and deploy applications. Jenkins Pipeline allows you to compose multiple steps in an easy way that can help you model any sort of automation process.

> Think of a "**step**" like a single command which performs a single action. When a step succeeds it moves onto the next step. When a step fails to execute correctly the Pipeline will fail.

> When all the steps in the Pipeline have successfully completed the Pipeline is considered to have successfully executed. ...
> 

> ... The **sh** step is used to execute a shell command in a Pipeline.
>
> The **agent** directive tells Jenkins where and how to execute the Pipeline, or subset thereof. 
 
-- [Jenkins Guided Tour: Running Multiple Steps](https://jenkins.io/doc/pipeline/tour/running-multiple-steps/)

---

Example pipeline, this goes into a `Jenkinsfile` at the top of your project:

```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'gcc hello.c -o hello'
            }
        }
        stage('Test') {
            steps {
                sh './hello | grep Hello'
            }
        }
        stage('Deploy') {
            steps {
                sh 'scp hello root@stage.example.com:/usr/local/bin'
            }
        }
    }
}

```

---
## More Jenkins Terms
From [Jenkins glossary](https://jenkins.io/doc/book/glossary/), we have:

- **Node**  A machine which is part of the Jenkins environment and capable of executing Pipelines or Projects.
- **Pipeline** A user-defined model of a continuous delivery pipeline
- **Project** A user-configured description of work which Jenkins should perform, such as building a piece of software, etc.
- **Agent** An agent is typically a machine, or container, which connects to a Jenkins master and executes tasks when directed by the master.
- **Master** The central, coordinating process which stores configuration, loads plugins, and renders the various user interfaces for Jenkins.
- **Stage** stage is part of Pipeline, and used for defining a conceptually distinct subset of the entire Pipeline, for example: "Build", "Test", and "Deploy", which is used by many plugins to visualize or present Jenkins Pipeline status/progress.
- **Step** A single task; fundamentally steps tell Jenkins what to do inside of a Pipeline or Project.
- **Workspace** A disposable directory on the file system of a Node where work can be done by a Pipeline or Project. Workspaces are typically left in place after a Build or Pipeline run completes unless specific Workspace cleanup policies have been put in place on the Jenkins Master.

---

## Set up Infrastructure
### Shut down Runner Server
Shut down Runner Server, as we'll be using Jenkins going forward.

```bash
sudo service gitlab-runner stop
```
---

## Set up Infrastructure
### Shut down GitLab

Shut down GitLab, as one of it's components listens on port 8080 which will conflict with Jenkins which listens on 8080 out of the box (we are going to change that):

```bash
sudo gitlab-ctl stop
```

---
## Set up Infrastructure
### Install Jenkins

```bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install jenkins
```
Reference: [installation instructions](https://jenkins.io/download/)
---

## Set up Infrastructure
### Change Jenkins port

By default, Jenkins listens on port 8080.

Change that to 8081 due to conflict with a GitLab component:

```bash
sudo service jenkins stop
sudo sed -i /etc/init.d/jenkins -e 's:JENKINS_ARGS:JENKINS_ARGS --httpPort=8081:'
sudo systemctl daemon-reload
sudo service jenkins start
sudo gitlab-ctl start
```

---

## Set up Infrastructure
### Log in to Jenkins
Log in to Jenkins on port 8081, using the hostname you noted earlier, when you installed GitLab; and punch in the initial admin password, which you can find in:

```console
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
---

## Set up Infrastructure
### Install Suggested Plugins

Select "Install Suggested Plugins".

Jenkins has a very rich plugin ecosystem: nearly 1,800 publicly listed plugins as of September 2017.

The [Plugins Index](https://plugins.jenkins.io) makes it easy to browse and search for plugins.

---

## Set up Infrastructure
### (Don't) Create First Admin User

You can skip the "create first admin user" form by selecting "continue as admin" at the bottom of the form.

In production, you'd want to use named accounts for administrators, for accountability; but for this tutorial, we'll stick with `admin`.

---

### Configure a pipeline in Jenkins

Select "New item", give it a name (e.g., "shiny") and 
a type (select "Multibranch Pipeline").

---
### Configure Git back-end

In the "Branch Sources" pull-down menu, select "Git".

Under "Project Repository", put the Git URL of your "www" project, e.g., 
http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git

Check the "Scan Multibranch Pipeline Triggers" box and set the Interval to 1 hour (these are small VMs).

Click Save, and you should see something like this: (next slide)

---
```text
Scan Multibranch Pipeline Log

Started
[Tue Oct 31 16:52:28 UTC 2017] Starting branch indexing...
 > git --version # timeout=10
 > git ls-remote http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
Creating git repository in /var/lib/jenkins/caches/git-4e009f006aeb466fdf030686c9250da9
 > git init /var/lib/jenkins/caches/git-4e009f006aeb466fdf030686c9250da9 # timeout=10
Setting origin to http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git
 > git config remote.origin.url http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
Fetching & pruning origin...
Fetching upstream changes from origin
 > git --version # timeout=10
 > git fetch --tags --progress origin +refs/heads/*:refs/remotes/origin/* --prune
Listing remote references...
 > git config --get remote.origin.url # timeout=10
 > git ls-remote -h http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
Checking branches...
  Checking branch prod
      ‘Jenkinsfile’ not found
    Does not meet criteria
  Checking branch master
      ‘Jenkinsfile’ not found
    Does not meet criteria
Processed 2 branches
[Tue Oct 31 16:52:32 UTC 2017] Finished branch indexing. Indexing took 3.8 sec
Finished: SUCCESS
```
---
### Add Jenkinsfile

The log showed Jenkins is looking for `Jenkinsfile`.

Add a file called `Jenkinsfile` to the top of your project.

This file is like `.gitlab-ci.yml`, it consists of stages
(in sequence); with each stage made of jobs (which Jenkins
calls "steps").

It also contains the `agent` directive, which tells Jenkins where and how to execute the Pipeline, or subset thereof. More on this soon.

```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'gcc hello.c -o hello'
            }
        }
        stage('Test') {
            steps {
                sh './hello | grep Hello'
            }
        }
        stage('Deploy') {
            steps {
                sh 'scp hello root@stage.example.com:/usr/local/bin'
            }
        }
    }
}

```

---

We are going to need a `hello.c` for this demo.

Add a file `hello.c` to the top of our project, we'll use it for initial
testing of our Jenkins pipeline:

```c
# include <stdio.h>
main()
{
    printf("Hello World");
}
```

---

Select "Scan Multibranch Pipeline Now" after adding the `Jenkinsfile`, and look at the scan log:

```text
Started by user admin
[Tue Oct 31 16:55:28 UTC 2017] Starting branch indexing...
 > git --version # timeout=10
 > git ls-remote http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
 > git rev-parse --is-inside-work-tree # timeout=10
Setting origin to http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git
 > git config remote.origin.url http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
Fetching & pruning origin...
Fetching upstream changes from origin
 > git --version # timeout=10
 > git fetch --tags --progress origin +refs/heads/*:refs/remotes/origin/* --prune
Listing remote references...
 > git config --get remote.origin.url # timeout=10
 > git ls-remote -h http://ec2-18-195-25-169.eu-central-1.compute.amazonaws.com/root/www.git # timeout=10
Checking branches...
  Checking branch prod
      ‘Jenkinsfile’ not found
    Does not meet criteria
  Checking branch master
      ‘Jenkinsfile’ found
    Met criteria
Scheduled build for branch: master
Processed 2 branches
[Tue Oct 31 16:55:29 UTC 2017] Finished branch indexing. Indexing took 0.46 sec
Finished: SUCCESS
```
You can see Jenkins found `Jenkinsfile` in the "master" branch and scheduled a build.

---

Select "Build History" (in the left-hand nav bar) and you can see the build failed.

If you select the broken build (#1), and then select "Console Output", 
you can see just where the pipeline failed:

```text
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] sh
[shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA] Running shell script
+ gcc hello.c -o hello
/var/lib/jenkins/workspace/shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA@tmp/durable-2b815199/script.sh: 2: /var/lib/jenkins/workspace/shiny_master-673BQMYXMXJNV375U2SCGTPEIJ7N3PR7ZX2JOVAXNW5GYCENX4NA@tmp/durable-2b815199/script.sh: gcc: not found
[Pipeline] }
```
---
Actually, we don't want to run build jobs in the shell, do we?

Builds should be reproducible, so let's move this activity to a container.

Go to "Manage Jenkins" -> "Manage Plugins" -> "Available", and search for Docker.

Voila! "Docker plugin" from https://plugins.jenkins.io/docker-plugin

> Docker plugin allows to use a docker host to dynamically provision build agents, run a single build, then tear-down agent.

Select the checkbox next to "docker-plugin" and select "Download now and install after restart", and on the next screen, check the box to "Restart Jenkins when no jobs are running".

---
### Allow Jenkins to use Docker


```bash
sudo usermod -aG docker jenkins
sudo service jenkins restart
```
---
### Configure Jenkins to use Docker


Go to "Manage Jenkins" -> "Configure System" -> "Cloud" -> "Add a new cloud" -> "Docker"

For name, use "my-docker-cloud". 

For "Docker Host URI", use `unix:///var/run/docker.sock`

Select "Test connection" and Jenkins should connect to the Docker API and return the version of the API.

Select "Save".

---

### Dockerfile

Add a `Dockerfile` file to the top of our project:

```
# vim:set ft=dockerfile:
FROM ubuntu:latest

RUN apt-get update \
        && apt-get install -y build-essential

```


---
### Configure Jenkinsfile to use Dockerfile

```
pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent { dockerfile true }
            steps {
                sh 'cat /etc/*release'
                sh 'gcc hello.c -o hello'
            }
        }
        stage('Test') {
            agent { dockerfile true }
            steps {
                sh './hello | grep Hello'
            }
        }
        stage('Deploy') {
            agent any
            steps {
                sh 'scp -i ~jenkins/.ssh/push_to_stg hello root@stage.example.com:/usr/local/bin'
            }
        }
    }
}


```
---
### Set up trust (for deploys)

Allow Jenkins to deploy to Stage over SSH:

```bash
sudo su - jenkins -c "mkdir .ssh; chmod 0700 .ssh; cd .ssh; ssh-keygen -f push_to_stg -N ''"
sudo cat ~jenkins/.ssh/push_to_stg.pub | sudo tee -a ~root/.ssh/authorized_keys
sudo su - jenkins -c "ssh-keyscan -H stage.example.com >> ~jenkins/.ssh/known_hosts"
```
---
### Try it

You should now be able to run your pipeline and Jenkins
should deploy the newly minted and tested binary.

---
### Manual trigger

How do we set up a manual trigger, similar to the "Play" button in GitLab?

Try running this `Jenkinsfile` and watch the Console Output in the Jenkins UI:

```
pipeline {
    agent any
    stages {
        /* "Build" and "Test" stages omitted */

        stage('Deploy - Staging') {
            steps {
                sh 'echo deploy staging'
                sh 'echo run-smoke-tests'
            }
        }

        stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }

        stage('Deploy - Production') {
            steps {
                sh 'echo /deploy production'
            }
        }
    }
}
```
---

### Blue vs Green

You may have noticed the balls and progress bars are blue instead of green, when everything is OK.

The creator of Jenkins, Kohsuke Kawaguchi, is Japanese, and in Japan, green is considered a shade of blue.

If this bugs you, install the ["Green Balls"](https://wiki.jenkins.io/display/JENKINS/Green+Balls) plugin to turn the blue balls green.

References:
- https://jenkins.io/blog/2012/03/13/why-does-jenkins-have-blue-balls/ 
- http://www.atlasobscura.com/articles/japan-green-traffic-lights-blue
---

## Checking Pipeline status with Jenkins Blue Ocean UI

Install the "Blue Ocean" plug-in (Manage Jenkins -> Manage Plugins).  Once it installs and Jenkins restarts, you can select "Open Blue Ocean" in the main menu, and you will see a visual representation of your Pipelines and Projects.

---
## Troubleshooting

- Take a look at the log file on /log at your Jenkins UI
- Take a look at /var/log/jenkins/jenkins.log
- Install the [monitoring](https://wiki.jenkins.io/display/JENKINS/Monitoring) plug-in and visit /monitoring at your Jenkins UI

Reference: http://www.scmgalaxy.com/tutorials/jenkins-troubleshooting

---

## Finished early?

Finished early?

Go to https://gitlab.com/atsaloli/gitlab-ci-tutorial/blob/master/gitlab-ci/README.md and enjoy our bonus GitLab content.

(Auto DevOps GitLab/Kubernetes integration is especially fun.)

---

## GitLab Users BoF

GitLab Users BoF is tonight at 7:00 PM in the Marina room (Scott Murphy organizing).
