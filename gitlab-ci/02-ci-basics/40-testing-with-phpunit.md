Given the following PHP files in www/html directory,
(based on the phpunit example code from GitHub repo
linked from https://www.sitepoint.com/getting-started-with-phpunit/):

Hello.php:

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

HelloTest.php:

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


And given this [yaml](yaml/test-phpunit.yml),


```yaml
test:
  image: php
  script: apt-get update && apt install -y phpunit && cd www/html && phpunit UnitTest HelloTest.php

```

We successfully test User.php using "phpunit":

```
...
PHPUnit 4.2.6 by Sebastian Bergmann.

.

Time: 42 ms, Memory: 2.50Mb

OK (1 test, 1 assertion)
Job succeeded
```
