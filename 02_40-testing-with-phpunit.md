## Configuring CI/CD pipelines
### Continuous Integration
#### Testing with PHPUnit

We are going to add some files: source code, and a unit test.

The next slide shows where to find the "New file" element in the GitLab project screen. (Select the plus sign, and then "New file" to add a file.)

---?image=images/add-new-file.png

---
## Configuring CI/CD pipelines
### Continuous Integration
#### Testing with PHPUnit

Add the following to your "www" project:

Hello.php (source code):

```php
<?php
class Greeting {
    public function talk() {
        $my_greeting = "Hello world";
        return "$my_greeting";
    }
}
?>
```

---
## Configuring CI/CD pipelines
### Continuous Integration
#### Testing with PHPUnit

Add the following to your "www" project:

HelloTest.php (unit test for `Hello.php`):

```php
<?php
require_once 'PHPUnit/Autoload.php';
require_once "Hello.php";
class HelloTest extends PHPUnit_Framework_TestCase
{
    public function testTalk() {
        $expected = "Hello world";
        $actual = Greeting::talk();
        $this->assertEquals($expected, $actual);
    }
}
```
Credit: https://www.sitepoint.com/getting-started-with-phpunit/

---
## Configuring CI/CD pipelines
### Continuous Integration
#### Testing with PHPUnit

Run this pipeline to test Hello.php using HelloTest.php under the
`phpunit` unit test framework:

```yaml
test:
  tags:
  - docker
  image: php
  script: apt-get update && apt install -y phpunit && phpunit UnitTest HelloTest.php

```

PHPUnit is one of the many xUnits out there.  See https://en.wikipedia.org/wiki/XUnit to learn more.

---
## Configuring CI/CD pipelines
### Continuous Integration
#### Testing with PHPUnit

You should see something like this:

```
...
PHPUnit 4.2.6 by Sebastian Bergmann.

.

Time: 42 ms, Memory: 2.50Mb

OK (1 test, 1 assertion)
Job succeeded
```

If any of the tests don't pass, phpunit will exit with non-zero status,
and the test job will fail.

---
Let's add one more file, `index.php`:

```php 
<?php
include('Hello.php');
echo '<h1>', Greeting::talk(), '</h1>', "\n";
?>
```
