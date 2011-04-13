Feature: Editing articles
  In order to view article
  As a user
  I want to view them

  Background:
    Given there are the following articles:
      |id |           file          |     subtitle      |
      | 1 | spec/fixtures/sarah.jpg | my beautiful girl |
    Given I am on the homepage
    When I tap image id 1

  Scenario:


