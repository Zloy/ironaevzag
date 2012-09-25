Feature: Ironaevzag has a search in translations feature.

Background:
  Given I am on "Ironaevzag" 
    And I wait until active Ajax requests are complete

Scenario: Substitute ё with æ and switch language switcher on grave kypress 
  When I filled filter with "тæм"
    And I press [grave]
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "а,абонемент,абстракция,акцент"

Scenario: Substitute ` with æ and switch language switcher on Cyrillic_io keypress
  When I filled filter with "тæм"
    And I press [Cyrillic_io]
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "а,абонемент,абстракция,акцент"

Scenario: Search for translations by click on language switcher 
  When I filled filter with "тæмæ"
    And I wait until active Ajax requests are complete
    And search language is "рус"
    And I click on the language switcher
    And I wait until active Ajax requests are complete 
    And search language is "ос"
  Then I should see the filtered words "а,абонемент,абстракция,акцент"
    And I click on the language switcher
    And I wait until active Ajax requests are complete 
    And search language is "рус"
    And I should see the filtered words ""

Scenario: Search for translations by pressing F7 
  When I filled filter with "тæмæ"
    And I wait until active Ajax requests are complete
    And search language is "рус"
    And I press [F7]
    And I wait until active Ajax requests are complete 
    And search language is "ос"
  Then I should see the filtered words "а,абонемент,абстракция,акцент"
    And I press [F7]
    And I wait until active Ajax requests are complete 
