Feature: Ironaevzag has a key pressing handling feature.

Background:
  Given I am on "Ironaevzag" 
    And I filled filter with "а___"
    And I wait until active Ajax requests are complete 
    And I should see the filtered words "агат,адат,азия,аист,айва"

Scenario: Selecting a word from the filtered words with ArrowDown
  When I press [Down]
    And I press [Down]
    And I wait until active Ajax requests are complete 
  Then the selected word is "азия"
    And I should see in the translation "1. Ази"

Scenario: Fast select the last word
  When I press [Up]
    And I wait until active Ajax requests are complete 
  Then the selected word is "айва"
    And I should see in the translation "1. къомси"

Scenario: All cyrillic characters shall be fine to input to the filter 
  When I press [Cyrillic_shorti Cyrillic_tse Cyrillic_u Cyrillic_ka Cyrillic_ie Cyrillic_en Cyrillic_ghe Cyrillic_sha Cyrillic_shcha Cyrillic_ze Cyrillic_ha Cyrillic_hardsign Cyrillic_ef Cyrillic_yeru Cyrillic_ve Cyrillic_a Cyrillic_pe Cyrillic_er Cyrillic_o Cyrillic_el Cyrillic_de Cyrillic_zhe Cyrillic_e Cyrillic_ya Cyrillic_che Cyrillic_es Cyrillic_em Cyrillic_i Cyrillic_te Cyrillic_softsign Cyrillic_be Cyrillic_yu]
  Then the filter should be "а___йцукенгшщзхъфывапролджэячсмитьбю"
