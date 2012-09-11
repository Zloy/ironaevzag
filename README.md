# Ironaevzag 

  * [Этот текст по русски](https://github.com/Zloy/ironaevzag/blob/master/README.ru.md)
  * [github.com/Zloy/ironaevzag](https://github.com/Zloy/ironaevzag)
  * [ironaevzag.1gb.ru](http://ironaevzag.1gb.ru)

The application name **Ironaevzag** is combined with words **Iron* and **Aevzag* - *Ossetian* and *Language* in Ossetian. That application is an online Russian to Ossetian dictionary built to conduct experiments with UI controls in the field of usability.


## How to use, main features

On the main page there are: 

1. The filter inpurt 
2. The filtered words list
3. The selected word translation

![Скриншот страницы словаря](https://github.com/Zloy/ironaevzag/blob/master/doc/dict_layout.png?raw=true)
When user types in the filter input (1.), AJAX request gets *the filtered words list* and displays them beneath the filter in the vertical list (2.).

Pressing ArrowUP/Down keys a user can select any word from *the filtered words list*. When selected word changed in the right area *the selected word translation* appears (3.). Some delay after the selected word is changed implemented before AJAX request triggered.

The focus stays on the filter even when Arrow keys used. That allows the user to change the filter value anytime he wants do that with no need of selection the filter input control. 


### Search with wildcards

There are two wildcards available: **_** underscore and **%** percent characters. 
The underscore character substitutes any single character, e.g. search for **а_** returns two character words, which start with **а**.
The percent character substitutes a group of any characters, e.g. search for **рос%** returns the filtered words list:
  * **рос**а
  * **рос**кошный
  * **рос**кошь
  * **рос**лый
  * **рос**пуск
  * **рос**сия
  * **рос**сыпь
  * **рос**т
  * **рос**товщик
  * **рос**ток


### Search in translations

The search could be performed in Russian words or in Ossetian translations. To swith the search mode the user should either press F7 or to click on *the language indicator* in the right upper corner of *the filter*. When it has the value **рус** the search performs in Russian words, otherwise it has the value **ос**, and the search performs in Osettian translations.

E.g. If *the language indicator* has the value **ос** and the user types in *the filter* the value **æзæг** the filtered words list contains the words, which translations contain **æзæг** group of characters. The wildcards are ignored in that mode.

When the key [~`] pressed, the character 'æ' is been typed in and the search mode switches to seacrh in translations, because the character 'æ' there is in Ossetian, but not in Russian.

## Internals

Ruby On Rails 3 
The app is deployed with capistrano to VDS, 4 Nginx workers serve static assets and pass requests for dynamic content to 4 Thin worker processes.

JavaScript
  * jquery 
  * jquery.ui
  * jquery.jgrowl
  * hand made jquery plugin **autocomplist**

Inspired by [S. Tabolov's dictionary powered by A. Zatvornitsky's utility](http://alex-zatv.narod.ru/mDict/index.html)
