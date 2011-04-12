Feature: Creating articles
  In order to create article that has image in it
  As a user
  I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Article"

  @javascript
  Scenario: Creating a article with attaching image file and some text
    And I attach the file "spec/fixtures/sarah.jpg" to "File" in frame "upload_iframe"
    Then I should see the image file in div id "previewdiv" 
    And I press "Create Article"
    Then I should see "Article was successfully created."

