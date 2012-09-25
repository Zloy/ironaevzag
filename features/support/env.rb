# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

# ===============================>
# http://habrahabr.ru/post/141259/
# ===============================>
require 'rubygems'
require 'spork'
require 'cucumber/formatter/unicode' 
require 'capybara' 
require 'capybara/dsl' 
require 'capybara/session' 
require 'selenium-webdriver' 
require 'capybara/cucumber' 
require 'capybara/mechanize/cucumber'
require 'database_cleaner'
require 'database_cleaner/cucumber'

# Заставляем Capybara игнорировать срытые элементы, устанавливаем время ожидания и хост по умолчанию
Capybara.default_driver         = :selenium
Capybara.ignore_hidden_elements = true 
Capybara.default_wait_time      = 15 
Capybara.server_port            = 3001
Capybara.app_host               = "http://localhost:3001"
=begin
# When using the selenium driver, the port can be found on:
Capybara.current_session.driver.rack_server.port
# and when using the webkit driver, it can be found on:
Capybara.current_session.driver.server_port
# Alternative, you can set
Capybara.server_port
#to a known value and use that.
=end

#
# регистрация драйвера для тестирования с фаером 
Capybara.register_driver :selenium do |app| 
    #profile = Selenium::WebDriver::Firefox::Profile.new # только если мы хотим создать ноый профиль для FF. 
    profile = Selenium::WebDriver::Firefox::Profile.from_name "WebDriver"
    #Selenium::WebDriver::Firefox.path = File.expand_path('~/path/to/firefox') # можем не указывать, тогда будет вызван FF по умолчанию. 
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile) 
end
#
# регистрация драйвера для тестирования без участия web-браузера
Capybara.register_driver :mechanize do |app| 
    Capybara::Mechanize::Driver.new(app) 
end

=begin
Cucumber перед выполнением того или иного сценария, вызывает секцию Before do … end. А после завершения сценария — After do … end. Если вы помните, то Cucumber поддерживает работу с тегами, т. е. мы можем указать перед сценарием какое-нибудь имя тега и в секции «Before» устанавливать драйвер для Capybara. Так же можно выводить названия не пройденных тестов из раздела «After», или отправлять письма, отчеты и так далее. Ради справедливости хочется заметить, что Capybara поддерживает не которые драйверы, по умолчанию, но я вам советую переопределять их самим. :)
=end

Before do |scenario| 
  if scenario.source_tag_names.include?('@no_browser') and Capybara.default_driver != :mechanize 
      Capybara.default_driver = :mechanize 
  elsif !scenario.source_tag_names.include?('@no_browser') and Capybara.default_driver != :selenium 
      Capybara.default_driver = :selenium 
  end 
end 

After do |scenario| 
    if scenario.failed? 
        puts scenario.name
        puts scenario.exception.message        
    end 
end

=begin
В новых версиях Capybara после каждого сценария, gem'ка сбрасывает сессию. Это грозит тем, что, если у вас есть система авторизации, то в каждом новом сценарии надо опять ее проходить. Этого можно избежать, если заблокировать данное действие. Необходимо перейти к gem файлу (ubuntu: …/gems/capybara-VERSION/lib/capybara/cucumber.rb) и поставить коммент перед «Capybara.reset_sessions!» в самой первой секции (секция After do … end). Это не все «новшества» обновлений: так же после каждого сценария, «Capybara» переводит браузер на чистую страницу. От этого так же не сложно «избавиться», если поставить комментарий перед «@browser.navigate.to('about:blank')» в «…/gems/capybara-VERSION/lib/capybara/selenium/driver.rb» файле.
=end

# Хочется так же отметить, что на некоторых тестовых окружения есть так называемая basic authority, это можно обойти путем передачи имени и пароля непосредственно в URL'е:
# Capybara.visit("http://#{$name}:#{$pass}@#{url}") 
# Открываем about:config страницу в FF.
#	Создаем новый целочисленный ключ (правое нажатие мыши → новый → 				целочисленный):
#	network.http.phishy-userpass-length со значение 255

# <===============================
# http://habrahabr.ru/post/141259/
# <===============================

ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

#DatabaseCleaner[:active_record].strategy = :transaction
#DatabaseCleaner.clean # clear test database
# load test data once https://github.com/cucumber/cucumber/wiki/fixtures ==>
require 'active_record/fixtures'
ActiveRecord::Fixtures.reset_cache  
fixtures_folder = File.join(Rails.root, 'test', 'fixtures')
fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
ActiveRecord::Fixtures.create_fixtures(fixtures_folder, fixtures)
# <==


Spork.prefork do
  require 'cucumber/rails'


  # Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
  # order to ease the transition to Capybara we set the default here. If you'd
  # prefer to use XPath just remove this line and adjust any selectors in your
  # steps to use the XPath syntax.
  Capybara.default_selector = :css

end
 
Spork.each_run do
  # By default, any exception happening in your Rails application will bubble up
  # to Cucumber so that your scenario will fail. This is a different from how 
  # your application behaves in the production environment, where an error page will 
  # be rendered instead.
  #
  # Sometimes we want to override this default behaviour and allow Rails to rescue
  # exceptions and display an error page (just like when the app is running in production).
  # Typical scenarios where you want to do this is when you test your error pages.
  # There are two ways to allow Rails to rescue exceptions:
  #
  # 1) Tag your scenario (or feature) with @allow-rescue
  #
  # 2) Set the value below to true. Beware that doing this globally is not
  # recommended as it will mask a lot of errors for you!
  #
  ActionController::Base.allow_rescue = false
  
  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    DatabaseCleaner.strategy = :transaction
    #DatabaseCleaner.strategy = :truncation, {:except => %w[dicts words translations langs]}
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  
  # You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
  # See the DatabaseCleaner documentation for details. Example:
  #
  #   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
  #     # { :except => [:widgets] } may not do what you expect here
  #     # as tCucumber::Rails::Database.javascript_strategy overrides
  #     # this setting.
  #     DatabaseCleaner.strategy = :truncation
  #   end
  #
  #   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
  #     DatabaseCleaner.strategy = :transaction
  #   end
  #
  
  # Possible values are :truncation and :transaction
  # The :transaction strategy is faster, but might give you threading problems.
  # See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
  Cucumber::Rails::Database.javascript_strategy = :truncation

end