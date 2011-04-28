Feature: Creating articles
  In order to create article that has image in it
  As a user
  I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Article"

  @javascript
  Scenario: Creating a article with attaching a image file writing and subtitles
    And I attach the file "spec/fixtures/sarah.jpg" to "File" in frame "upload_iframe"
    Then I should see the image file "sarah.jpg" in "div#previewdiv" 
    And I fill in "Subtitle 1" with "She is my beautiful girl friend Sarah"
    And I follow "Add Subtitle"
    And I fill in "Subtitle 2" with "We were wating pho in the Vietnamese restaurant"
    And I press "Create Article"
    Then I should see "Article was successfully created."
    Then I should be on the article page
    Then I should see the image file "sarah.jpg" in "div#image_view"
    Then I should see "She is my beautiful girl friend Sarah"
    When I click "div#image_view"
    Then I should see "We were wating pho in the Vietnamese restaurant"

  Scenario: Creating a article without attaching image file
    And I press "Create Article"
    Then I should see "You should upload at least one image file"

