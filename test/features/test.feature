Feature: Testing Cucumber Repeat

@repeat
Scenario: Works first time
  Given I do something
  Then I expect it this to pass on the first go

@repeat
Scenario: Fails First and then passes
  Given I do something
  Then I expect it this to pass on the second go

@repeat
Scenario: Fails Second and then passes
  Given I do something
  Then I expect it this to pass on the third go

Scenario: Does not repeat
  Given I do something
  Then I expect it this to pass on the first go
