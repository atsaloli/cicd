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


### Section 2. The benefits of Continuous Integration

1. READING
Read the first three sections of [Continuous Integration](https://www.thoughtworks.com/continuous-integration) page on ThoughtWorks.com:
  - Integrate at least daily
  - Solve problems quickly
  - More than a process
2. ESSAY
What would be the benefits of Continuous Integration for your organization and how would it impact you personally if your organization practiced it?

### Section 3. Definition of terms: DevOps

### Section 4. The relationship of CI/CD to DevOps

> Continuous delivery and DevOps have common goals and are often used in conjunction, but there are subtle differences.
>
While continuous delivery is focused on automating the processes in software delivery, DevOps also focuses on the organization change to support great collaboration between the many functions involved.
[Wikipedia entry for "DevOps"](https://en.wikipedia.org/wiki/DevOps#Continuous_delivery)

Bibliography:
- Article [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html) by Martin Fowler, Chief Scientist at ThoughtWorks, which created CruiseControl, the first Continuous Integration server (2001).