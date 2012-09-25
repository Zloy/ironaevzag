Feature: Ironaevzag has notifications 

Scenario: Notification about the help page when entering the site
  When I am on "Ironaevzag" 
  Then I should see text "Для справки нажмите клавишу F1"
