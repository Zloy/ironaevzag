#coding:utf-8
Given /^I am on "(.*?)"$/ do |page|
  def url_from_page page
    @pages ||= {"ironaevzag" => "/"}
    @url = @pages[page.downcase]
    raise "Unknown page" unless @url
  end
  visit url_from_page(page)
  Cucumber::Devilspie.spawn
end

When /^I wait until active Ajax requests are complete$/ do
  wait_until do
    page.evaluate_script('$.active') == 0
  end  
end

Then /^I click on the word "(.*?)"$/ do |word|
  element = Hash[*page.all('.word').map{|e| [e.text, e]}.flatten][word]
  assert_equal false, element.nil?,
    "There is no word '#{word}'"
  element.click
end

When /^I filled filter with "(.*?)"$/ do |text|
=begin
  # That works too with WebDriver
  #
  #element = page.first('#filter').native
  #element.send_keys text
  
  # And that works too with WebDriver
  #
  page.execute_script %Q{
    var e = jQuery.Event("keyup");
    e.which = 50; // # Some key code value
    e.keyCode = $.ui.keyCode.ENTER;
    $("#filter").focus().val('#{text}').trigger(e);
    //$('#filter').focus().val('#{text}').keyup();
    }
=end
  fill_in 'filter', :with => text
  sleep 1 # to trigger the filter change timeout
end

# Possible keys are all X11 keys, see xdotool man
#
When /^I press \[(.*)\]$/ do |key|
  `xdotool getactivewindow key --delay 300 #{key}`
  sleep 1 # to trigger the filter change timeout
end

Then /^I click on the language switcher$/ do
  page.first('#filter-lang').click
end
