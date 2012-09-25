Feature: Ironaevzag has  a group handling feature

Background:
  Given I am on "Ironaevzag" 
    And I wait until active Ajax requests are complete 
    And I should see the filtered words "а,абажур,абазинец,абазинский,абазинцы,абзац,абиссиния,абитуриент,абонемент,абонементный"

@wip
Scenario: When the user presses a key [+] the selected word is to be added to the group
    When I press [+]
    Then The group should contain a word "a"
