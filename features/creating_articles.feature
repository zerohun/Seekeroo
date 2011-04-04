Feature: Creating articles
  In order to create article that has image in it
  As a user
  I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Article"

  Scenario: Creating a article
    And I press "Create Article"
    Then I should see "Article was successfully created"
    And I should be on the first article page

  @javascript
  Scenario: Creating a article with attaching image file
    And I attach the file "spec/fixtures/sarah.jpg" to "Image file"
    And I should see "sarah.jpg" within "#article .preview"
    And I press "Create Article"
    Then I should see "Article was successfully created"
    And I should be on the first article page

