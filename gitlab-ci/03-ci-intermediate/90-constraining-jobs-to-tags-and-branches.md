# Restricting jobs to specific tags or branches 

The following job will only run on "test-" branches,
e.g., "test-feature1", "test-banana", etc.

```yaml
job:
  script: echo Testing your test code
  only:
  - /^test-.*$/
```


So if you don't want CI to run except for certain
commits, put those commits on a "test-X" branch.

See also "except", e.g.:

```yaml
job:
  script: echo Testing your test code
  except:
  - /^dont-test-.*$/
```


In the example below, job will run only for refs that
start with issue-, whereas all branches will be skipped.

```yaml
job:
  # use regexp
  only:
    - /^issue-.*$/
  # use special keyword
  except:
    - branches
```
