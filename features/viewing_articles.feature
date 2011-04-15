Feature: Viewing articles
  In order to view article
  As a user
  I want to view them

  Background:
    Given there are the following articles:
      |           file          |     subtitle      |
      | spec/fixtures/sarah.jpg | my beautiful girl |

    Given I am on the homepage

  Scenario:

    When I click "a#1"
    Then I should be on the article page
    Then I should see "my beautiful girl"
    Then I should see the image file "sarah.jpg" in "div#image_view"
