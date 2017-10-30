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
(Credit: https://www.sitepoint.com/getting-started-with-phpunit/)
---

And given this [CI config](yaml/test-phpunit.yml) that uses the Docker "php" container:


```yaml
test:
  image: php
  script: apt-get update && apt install -y phpunit && cd www/html && phpunit UnitTest HelloTest.php

```

Run the pipeline and it should test User.php using the "phpunit" unit test framework:

```
...
PHPUnit 4.2.6 by Sebastian Bergmann.

.

Time: 42 ms, Memory: 2.50Mb

OK (1 test, 1 assertion)
Job succeeded
```

