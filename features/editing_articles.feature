Feature: Editing articles
  In order to edit article
  As a user
  I want to edit them

  Background:
    Given there are the following articles:
      |           file          |     subtitle          |
      | spec/fixtures/sarah.jpg | my beautiful girl     |

    Given I am on the homepage

  @javascript
  Scenario:
    When I click "a#1"
    Then I should be on the article page
    Then I follow "Edit"
    Then I should see the image file "sarah.jpg" in "div#previewdiv"
    And I attach the file "spec/fixtures/halloween.jpg" to "File" in frame "upload_iframe"
    Then I should see the changed image file "halloween.jpg" in "div#previewdiv"
    And  I fill in "Subtitle 1" with "With Sarah in halloween day"
    And  I follow "Add Subtitle"
    And  I fill in "Subtitle 2" with "We were by a bar in Itaewon"
    And I press "Update Article"
    Then I should be on the article page
    Then I should see "Article was successfully updated."
    Then I should see the image file "halloween.jpg" in "div#image_view"
    Then I should see "With Sarah in halloween day"
    Then I should see "We were by a bar in Itaewon"
