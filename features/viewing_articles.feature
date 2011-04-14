Feature: Editing articles
  In order to view article
  As a user
  I want to view them

  Background:
    Given there are the following articles:
      | id |           file          |     subtitle      |
      | 1  | spec/fixtures/sarah.jpg | my beautiful girl |

    Given I am on the homepage

  Scenario:

    Then show me the page
    When I click "img"
    Then I should on the article page for id 1
