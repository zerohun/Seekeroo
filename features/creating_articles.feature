Feature: Creating articles
  In order to create article that has image in it
  As a user
  I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Article"

  @javascript
  Scenario: Creating a article with attaching image file
    And I attach the file "spec/fixtures/sarah.jpg" to "File" in frame "uploadFrame"
    And I should see "img"
    And I press "Create Article"
    Then show me the page
    Then I should see "Article was successfully created."

