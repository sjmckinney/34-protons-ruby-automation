Given(/^I am on the test page$/) do
  @demo_page.load
  expect(@demo_page.title).to eq('Demo page for selenium code')
  expect(@demo_page).to be_displayed
end

# Radio button test code

Given(/^radio button "([^"]*)" is selected$/) do |rb|

  #expect(has_checked_field?(rb.downcase)).to be true

  expect( @demo_page.radio_buttons.is_checked(rb) ).to be true

end

When(/^I select radio button "([^"]*)"$/) do |rb|

  #choose(rb.downcase)

  @demo_page.radio_buttons.do_check(rb)

end

Then(/^radio button "([^"]*)" is not selected$/) do |rb|

  #expect(has_no_checked_field?(rb.downcase)).to be true

  expect( @demo_page.radio_buttons.is_not_checked(rb) ).to be true

end


# Button test code

Given(/^the click count is (\d+)$/) do |numberOfClicks|

  expect(@demo_page.click_counter.click_count).to eq(numberOfClicks)

end

When(/^I click the Click Me button$/) do

  @demo_page.click_counter.click_counter_button

end

Then(/^the page has a button$/) do

  @demo_page.click_counter.has_button?

end


# table test code

Then(/^the table should have (\d+) rows$/) do |nos_rows|

  expect(@demo_page.table.count_table_rows).to eq(nos_rows.to_i)

end

Then(/^table row (\d+) should contain "([^"]*)"$/) do |row_nos, values|

  expect(@demo_page.table.get_row_values(row_nos)).to eq(values.delete(','))

end

# Drag and Drop test code
When(/^I drag and drop (\d+) icon$/) do |repetitions|

  @demo_page.drag_n_drop.drag_globe(repetitions)

end

Then(/^the counter should display "([^"]*)"$/) do |repetitions|

  repetitions.to_i < 6 ? value = repetitions : value  = 'No further drops permitted; drop area is full'
  expect(@demo_page.drag_n_drop.get_number_dragged).to eq(value)

end


When(/^I search for "([^"]*)" elements$/) do |css|

  expect(@demo_page.hidden.is_visible(css)).to be(true)

end



