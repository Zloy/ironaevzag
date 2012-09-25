Feature: Ironaevzag has a search in words feature.

Background:
  Given I am on "Ironaevzag" 

Scenario: Search words for empty filter 
  When I wait until active Ajax requests are complete 
  Then Page header should be "Русско-осетинский словарь"
    And I should see the filtered words "а,абажур,абазинец,абазинский,абазинцы,абзац,абиссиния,абитуриент,абонемент,абонементный"
    And I should see in the translation "не сегодня, а завтра - абон нæ, фæлæ райсом"

Scenario: Search for a translation after click on the word
  When I wait until active Ajax requests are complete 
  Then I click on the word "абзац"
    And I wait until active Ajax requests are complete 
    And I should see in the translation "начать с абзаца - абзацæй райдайын"

Scenario: Search for exact word after filter filled with it
  When I filled filter with "абазинцы"
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "абазинцы"
    And I should see in the translation "1. абаз"

Scenario: Search for words that begin with a pattern
  When I filled filter with "автом%"
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "автомагистраль,автомат,автоматический,автоматчик,автомашина,автомобиль,автомобильный"
    And I should see in the translation "1. автомагистрал (машинæты сæйраг фæндаг)"

Scenario: Search for words that end with a pattern
  When I filled filter with "%ль"
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "авиамодель,автомагистраль,автомобиль,акварель,алкоголь"
    And I should see in the translation "1. хæдтæхæджы хуызæг"

Scenario: Search for words that contain a pattern
  When I filled filter with "а_____ль"
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "акварель,алкоголь"
    And I should see in the translation "1. акварел (доны тад ахорæнтæй ныв)"

Scenario: Search for non existent word shall return words starting with it #74
  When I filled filter with "але"
    And I wait until active Ajax requests are complete 
  Then I should see the filtered words "алебастр,алеть"
