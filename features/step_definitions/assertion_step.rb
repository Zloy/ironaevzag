Then /^Page header should be "(.*?)"$/ do |text|
  assert_equal text, find('h1').text, "Page header should be '#{text}'"
end

Then /^I should see the filtered words "(.*?)"$/ do |words|
  words = words.split(',').map(&:strip).to_a
  elements = page.all('.word')
  assert_equal words.join(','), elements.map(&:text).join(','), 
    "The filtered words list mismatch"
end

Then /^the selected word is "(.*?)"$/ do |word|
  element = page.first('.word-selected')
  assert_equal word, element.text,
    "Wrond selected word"
end

Then /^I should see in the translation "(.*?)"$/ do |text|
  assert find('.word-translation').text.include?(text), 
    "Translation should include '#{text}'!"
end

Then /^I should see text "(.*?)"$/ do |text|
  assert page.text.include?(text), 
    "There should be visible text '#{text}' on the page"
end

Then /^I should NOT see text "(.*?)"$/ do |text|
  assert !page.text.include?(text),
    "There should NOT be visible text '#{text}' on the page"
end

When /^search language is "(.*?)"$/ do |value|
  assert_equal value, page.first('#filter-lang').text,
    "Wrong language switcher value"
end

Then /^the filter should be "(.*?)"$/ do |text|
  assert_equal text, page.first("#filter").value,
    "Mismatch the filter value"
end
