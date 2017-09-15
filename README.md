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

READ ["Continuous Deployment"](https://gitlab.com/atsaloli/gitlab-ci-tutorial/blob/setting_up_cicd_pipelines/glossary.md#continuous-deployment) entry in course glossary

READ ["Continuous Delivery"](https://gitlab.com/atsaloli/gitlab-ci-tutorial/blob/setting_up_cicd_pipelines/glossary.md#continuous-delivery) entry in course glossary


READ the following sections in [Continuous Integration](https://www.thoughtworks.com/continuous-integration) on ThoughtWorks.com (ThoughtWorks released the industry's first Continuous Integration server, CruiseControl, in 2001):
  - Integrate at least daily
  - Solve problems quickly
  - More than a process

### Section 2. Definition of terms: DevOps

### Section 3. The relationship of CI/CD to DevOps

> Continuous delivery and DevOps have common goals and are often used in conjunction, but there are subtle differences.
>
While continuous delivery is focused on automating the processes in software delivery, DevOps also focuses on the organization change to support great collaboration between the many functions involved.
[Wikipedia entry for "DevOps"](https://en.wikipedia.org/wiki/DevOps#Continuous_delivery)

Bibliography:
- Article [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html) by Martin Fowler, Chief Scientist at ThoughtWorks, which created CruiseControl, the first Continuous Integration server (2001).