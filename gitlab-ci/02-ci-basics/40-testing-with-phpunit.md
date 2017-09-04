Given the following PHP files in www/html directory,
(based on the phpunit example code from GitHub repo
linked from https://www.sitepoint.com/getting-started-with-phpunit/):

User.php:
```php
<?php
class User {
    protected $name;
    public function getName() {
        return $this->name;
    }
    public function setName($name) {
        $this->name = $name;
    }
    public function talk() {
        return "Hello world!";
    }
}

```
and the test file, UserTest.php:

```php

<?php
require_once "User.php";
class UserTest extends PHPUnit_Framework_TestCase
{
    protected $user;
    protected function setUp() {
        $this->user = new User();
        $this->user->setName("Tom");
    }
    protected function tearDown() {
        unset($this->user);
    }
    public function testTalk() {
        $expected = "Hello world!";
        $actual = $this->user->talk();
        $this->assertEquals($expected, $actual);
    }
}

```

And given this [yaml](/yaml/test-phpunit.yml),
we successfully test User.php using "phpunit":

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Shell executor...
Running on 52df9575-cb19-4284-9991-61f3eda72c31...
Fetching changes...
HEAD is now at 5160db2 Add shiny new website
From http://gitlab.gitlabtutorial.org/root/example4
   5160db2..5ae52a8  master     -> origin/master
   5160db2..7ff3979  production -> origin/production
Checking out 5ae52a87 as master...
$ cd www/html && phpunit UnitTest UserTest.php
PHPUnit 5.1.3 by Sebastian Bergmann and contributors.

.                                                                   1 / 1 (100%)

Time: 26 ms, Memory: 4.00Mb

OK (1 test, 1 assertion)
Build succeeded
```
