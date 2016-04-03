Feature: Demo of using Page Objects to define web page using SitePrism framework

  @pom_radio_button
  Scenario: Tests for radio button elements
    Given I am on the test page
    And radio button "Upper" is selected
    When I select radio button "Lower"
    Then radio button "Lower" is selected
    But radio button "Upper" is not selected

  @pom_button_a
  Scenario: Tests for button element
    Given I am on the test page
    And the click count is 0
    When I click the Click Me button
    Then the click count is 1

  @pom_button_b
  Scenario: Tests for button element exists on page
    Given I am on the test page
    Then the page has a button

  @pom_table_a
  Scenario: Tests for table element
    Given I am on the test page
    Then the table should have 4 rows

  @pom_table_b
  Scenario: Tests for table element; row 4
    Given I am on the test page
    Then table row 4 should contain "Breakfast, Lunch, Dinner"

  @pom_table_c
  Scenario: Tests for table element; row 2
    Given I am on the test page
    Then table row 2 should contain "Apple, Cox, Pippin, Orange, Pear"

  @pom_drag_a
  Scenario: Tests for drag and drop one item
    Given I am on the test page
    When I drag and drop 1 icon
    Then the counter should display "1"

  @pom_drag_b
  Scenario: Tests for drag and drop two items
    Given I am on the test page
    When I drag and drop 2 icon
    Then the counter should display "2"

  @pom_drag_c
  Scenario: Tests for drag and drop more than five items
    Given I am on the test page
    When I drag and drop 6 icon
    Then the counter should display "No further drops permitted; drop area is full"

  @pom_hidden_block
  Scenario: Tests for hidden elements: block
    Given I am on the test page
    Then I expect the the "block" element to be visible

  @pom_hidden_none
  Scenario: Tests for hidden elements: none
    Given I am on the test page
    Then I expect the the "none" element to not be visible
