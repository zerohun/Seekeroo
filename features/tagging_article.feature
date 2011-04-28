Feature: Tagging articles
  In order to tag article
  As a user
  I want to tag them

  Background:
    Given there are the following articles:
      |           file          |     subtitle      |
      | spec/fixtures/sarah.jpg | my beautiful girl |

    Given I am on the homepage

  @javascript
  Scenario:
    When I click "a#1"
    Then I should be on the article page
    Then I should see "my beautiful girl"
    Then I should see the image file "sarah.jpg" in "div#image_view"
    When I click "a#trigger_tag"
    Then I tag once
    Then I fill in "Tag Subtitle" with "it just for test"
    Then I press "Confirm"
    Then I click "a#end_tag"
    Then I click "div.tag"
    Then I should see "it just for test"


