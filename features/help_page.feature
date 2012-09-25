Feature: Ironaevzag has a help page

Background:
  Given I am on "Ironaevzag" 
    And I wait until active Ajax requests are complete

Scenario: Getting help page by pressing F1, closing it by Esc
  When I filled filter with "тæм"
    And I press [F1]
  Then I should see text "F1 показать/спрятать справку"
    And I press [Escape]
    And I should NOT see text "F1 показать/спрятать справку"

Scenario: Getting help page by pressing F1, closing it by F1 
  When I filled filter with "тæм"
    And I press [F1]
  Then I should see text "F1 показать/спрятать справку"
    And I press [F1]
    And I should NOT see text "F1 показать/спрятать справку"
