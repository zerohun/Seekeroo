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

  Scenario: Creating a article with image
    And I attach the file "spec/fixtures/sarah.jpg" to "Image"
    And I press "Create Article"
    Then I should see "Article was successfully created"
    And I should be on the first article page
