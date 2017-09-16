# Setting up CI/CD Pipelines

## Part I - Introduction and Orientation

### Section 1. Definitions of terms

**CI/CD**
Continuous Integration / Continuous Deployment

**Continuous**
(adjective)  Forming an unbroken whole; without interruption.
-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/continuous)

**Integration**
(noun) The action or process of integrating.
-- [Oxford Dictionaries](https://en.oxforddictionaries.com/definition/us/integration)

**Integrate**
(verb) to unite with something else; to incorporate into a larger unit
-- [Merriam-Webster](https://www.merriam-webster.com/dictionary/integrate)

**Continuous Integration**
> **Continuous Integration** is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly.

-- ["Continuous Integration"](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler, Chief Scientist at ThoughtWorks, first to market with a Continuous Integration server in 2001.

&nbsp;

> **Continuous integration (CI)** is the practice of merging all developer working copies to a shared mainline several times a day.  ... The main aim of CI is to prevent integration problems.

-- [Wikipedia entry "Continuous Integration"](https://en.wikipedia.org/wiki/Continuous_integration)



> **Continuous Deployment** is closely related to Continuous Integration
> and refers to the release into production of software that passes the
> automated tests.

-- [ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

> **Continuous Delivery** is sometimes confused with continuous deployment. Continuous deployment means that every change is automatically deployed to production. Continuous delivery means that the team ensures every change can be deployed to production but may choose not to do it, usually due to business reasons. In order to do continuous deployment one must be doing continuous delivery.

-- [Wikipedia](https://en.wikipedia.org/wiki/Continuous_delivery)


### Section 2. Benefits of Continuous Integration

1. READING
Read the first three sections of [Continuous Integration](https://www.thoughtworks.com/continuous-integration) page on ThoughtWorks.com:
  - Integrate at least daily
  - Solve problems quickly
  - More than a process
2. ESSAY
What would be the benefits of Continuous Integration for your organization and how would it impact you personally if your organization practiced it?

### Section 3. Definition of terms: DevOps


> The term “DevOps” typically refers to the emerging professional movement that advocates a collaborative working relationship between Development and IT Operations, resulting in the fast flow of planned work (i.e., high deploy rates), while simultaneously increasing the reliability, stability, resilience and security of the production environment.  Why Development and IT Operations? Because that is typically the value stream that is between the business (where requirements are defined) and the customer (where value is delivered).

-- [Top 11 Things You Need to Know about DevOps](http://images.itrevolution.com/documents/Top_11_DevOps_01_2015.pdf)
 
> Currently, **DevOps** is more like a philosophical movement, and not yet a precise collection of practices, descriptive or prescriptive ...  At this early stage we’re in, DevOps is more like a vibrant community of practitioners who are interesting in replicating the performance outcomes and culture as exemplified in the seminal John Allspaw/Tim Hammond 2009 Velocity presentation about doing “ten deploys a day” at Flickr.

-- [Gene Kim](http://www.realgenekim.me/devops-cookbook/), author of ["The DevOps Handbook"](http://itrevolution.com/devops-handbook)

> DevOps is... an umbrella concept that refers to anything that smoothes out the interaction between development and operations.

["What is Devops?", Damon Edwards](http://dev2ops.org/2010/02/what-is-devops/)

> DevOps (a clipped compound of "development" and "operations") is a software development and delivery process that emphasizes communication and collaboration between product management, software development, operations professionals and close alignment with business objectives. It supports this by automating and monitoring the process of software integration, testing, deployment, and infrastructure changes by establishing a culture and environment where building, testing, and releasing software can happen rapidly, frequently, and more reliably.

-- [Wikipedia entry, DevOps](https://en.wikipedia.org/wiki/DevOps)

> DevOps practices and procedures lead to smoothing out the typically ‘bumpiest’ aspects of software development and deployment. By pulling infrastructure setup and awareness earlier in the development cycle, surprises from environmental differences are significantly reduced.
>
> By establishing consistent, reliable and repeatable automated deployments, human error and the need for ‘rockstar firefighters’ are reduced.

-- ["What Is DevOps?", Daniel Greene](https://techcrunch.com/2015/05/15/what-is-devops/)

### Section 4. The relationship of CI/CD to DevOps

> Continuous delivery and DevOps have common goals and are often used in conjunction, but there are subtle differences.
>
While continuous delivery is focused on automating the processes in software delivery, DevOps also focuses on the organization change to support great collaboration between the many functions involved.

-- [Wikipedia entry for "DevOps"](https://en.wikipedia.org/wiki/DevOps#Continuous_delivery)

> The **deployment pipeline**, first defined by Jez Humble and David Farley in their book "Continuous Delivery: Reliable Software Releaes Through Build, Test, and Deployment Automation", ensures that all code checked in to version control is automatically built and tested in a production-like environment. By doing this, we find any build, test or integration errors as soon as a change is introduced, enabling us to fix them immediately. Done correctly, this allows us toalways be assured that we are in a deployable and shippable state.
>
> To achieve this, we must create automated build and test processes that run in dedicated environments.

-- "The DevOps Handbook", Chapter 10 "Enable Fast and Reliable Automated Testing"


## Bibliography
- ["Continuous Integration"](https://martinfowler.com/articles/continuousIntegration.html) article by Martin Fowler, Chief Scientist at ThoughtWorks, which created CruiseControl, the first Continuous Integration server (2001).
- [Continuous Deployment at IMVU: Doing the impossible fifty times a day."](http://timothyfitz.com/2009/02/10/continuous-deployment-at-imvu-doing-the-impossible-fifty-times-a-day/) article by Timothy Fitz (2009).