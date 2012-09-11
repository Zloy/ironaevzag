# Ironaevzag 

  * [This text in English](https://github.com/Zloy/ironaevzag/blob/master/README.md)
  * [github.com/Zloy/ironaevzag](https://github.com/Zloy/ironaevzag)
  * [ironaevzag.1gb.ru](http://ironaevzag.1gb.ru)

Название сайта **Ironaevzag** происходит от двух осетинских слов **Iron* and **Aevzag** -  *Осетинский* и *Язык*. Этот сайт является онлайн русско-осетинским словарем.

## Как пользоваться, основные функции

На главной странице расположены:

1. Фильтр поиска
2. Найденные слова
3. Перевод выбранного слова

![Скриншот страницы словаря](https://github.com/Zloy/ironaevzag/blob/master/doc/dict_layout.png?raw=true)

Когда в поле ввода фильтра поиска (1.) изменяется значение, производится запрос к сайту для поиска слов, удовлетворяющих условию поиска, заданному значением в поле фильтра. Найденные слова выводтся в веритикальном списке под фильтром.

Используя клавиши стрелок вверх и вниз можно выбрать одно из найденных слов (2.). При выборе нового слова на сайт отправляется запрос перевода этого слова, который появляется справа от списка найденных слов (3.)

При выборе слова фокус ввода остается на фильтре, поэтому можно в любой момент поменять значение фильтра, начав набирать новое значение.


## Поиск по шаблону

Можно использовать два символа: подчеркивания **_** и процента **%**.
Подчеркивание обозначает одну любую букву, а процент - любое количество любых букв. Например, поиск по шаблону **рос%** выберет слова:
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


## Поиск в переводах

Поиск можно выполнять не только в русских словах, но и в осетинских переводах. Выбор того, в чем искать переключается клавишей F7 или кликом мыши на индикаторе режима поиска, расположенном в правом верхнем углу поля ввода фильтра.
Значение "рус" означает, что поиск будет выполяться в русских словах, а значение "ос" что поиск будет выполняться в переводах. При поиске в переводах символы _ и % игнорируются.

При нажатии на кнопку [~`ё] вместо буквы *ё* печатается буква *æ* и режим поиска переключается в "ос". Вместо буквы ё во всех русских словах используется буква е.

## Технические детали

Ruby On Rails 3
Приложение  с помощью capistrano развертывается на VDS, 4 рабочих процесса Nginx отгружают статические ресурсы, а запросы к динамическому контенту перенаправляют 4-м рабочим процессам сервера приложений Thin.

JavaScript 
  * jquery 
  * jquery.ui
  * jquery.jgrowl
  * hand made jquery plugin **autocomplist**

По мотивам [словаря Таболова С.А на движке mDict от Затворницкого А.П.](http://alex-zatv.narod.ru/mDict/index.html)