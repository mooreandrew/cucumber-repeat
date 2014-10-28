Cucumber Repeater
===============

This will repeat a scenario which fails up to 2 additional times. It will repeat the whole scenario again.

How you use?
============

Either tag the scenario of feature with the @repeat tag

Scenario e.g:

```
@repeat
Scenario: Works first time
  Given I do something
  Then I expect it this to pass on the second go
```

Feature e.g:

```
@repeat
Feature: Testing Cucumber Repeat

Scenario: Works first time
  Given I do something
  Then I expect it this to pass on the second go
```

Outputting results
============
This will display results in the pretty format, additionally it is also able to display the results as Junit.

To output as Pretty do:

```
cucumber --format Cucumber::Formatter::Pretty
```

To output as Junit do:

```
cucumber --format Cucumber::Formatter::JunitRepeater --out results/
```
Note: this still displays some Pretty text


To output as Junit and Pretty:
```
cucumber --format Cucumber::Formatter::Pretty --format Cucumber::Formatter::JunitRepeater --out results/
```
