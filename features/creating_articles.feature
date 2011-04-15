Feature: Creating articles
  In order to create article that has image in it
  As a user
  I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Article"

  @javascript
  Scenario: Creating a article with attaching image file writing and subtitle
    And I attach the file "spec/fixtures/sarah.jpg" to "File" in frame "upload_iframe"
    Then I should see the image file "sarah.jpg" in "div#previewdiv" 
    And  I fill in "Subtitle" with "She is my beautiful girl friend Sarah"
    And I press "Create Article"
    Then I should see "Article was successfully created."
    Then I should be on the article page
    Then I should see "She is my beautiful girl friend Sarah"
    Then I should see the image file "sarah.jpg" in "div#image_view"

  Scenario: Creating a article without attaching image file
    And I press "Create Article"
    Then I should see "You should upload at least one image file"

