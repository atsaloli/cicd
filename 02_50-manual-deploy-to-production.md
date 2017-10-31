## Configuring CI/CD pipelines
### Continuous Delivery

Below you can see the tests have passed, deploy to Stage is in progress,
and deploy to Prod is set to manual (you have to click the Play triangle
to start it):

![Deploy to STG in progress](images/deploy-to-stage-is-running.png)


---
## Configuring CI/CD pipelines
### Continuous Delivery

After the deploy to Stage completes, we see:

![Ready for deploy to PRD](images/manual-deploy-ready.png)

---
## Configuring CI/CD pipelines
### Continuous Delivery

If you look at the pipeline detail, you can see the deploy to 
Prod was skipped, and is tagged as a "manual" deploy:

![pipeline detail](images/pipeline-detail.png)
