#Collection of page Objects on http://www.34protons.co.uk/demo_2_0/

class RadioButtons < SitePrism::Section

  def do_check(rb_name)

    choose(rb_name.downcase)

  end

  def is_checked(rb_name)

    has_checked_field?(rb_name.downcase)

  end

  def is_not_checked(rb_name)

    has_no_checked_field?(rb_name.downcase)

  end

end

class ClickCounter < SitePrism::Section

  element(:button, '#clickMe')
  element(:click_counter, '#nosClicks')

  def click_counter_button

    #button.click
    page.all('button', :text => 'Click Me').first.click

  end

  def click_count

    click_counter.text

  end

end

class Table < SitePrism::Section

  sections(:table_rows, 'tr') do
    elements(:table_cells, 'td')
  end

  def count_table_rows

    table_rows.length

  end

  def get_row_values(row)

    row_text = ''

    table_rows[row.to_i - 1].table_cells.each do |cell|
        row_text += (cell.text + ' ')
    end

    #row_text = table_rows[row.to_i - 1].text
    row_text.strip

  end

end

class DragNDrop < SitePrism::Section

  element(:counter, '#dropCount')
  element(:globe_icon, '.dragSrc #draggable')
  element(:drag_source,'.dragSrc')
  element(:drag_target, '#droppable')

  def drag_globe(repetitions)

    r = 1..repetitions.to_i
    r.each {globe_icon.drag_to(drag_target)}

  end

  def get_number_dragged

    counter.text.delete('-').strip

  end

end

class HiddenText < SitePrism::Section

  element(:display_block, '#block')
  element(:display_none, '#none')

  def is_visible(css)

    if(css == 'block')
      text = 'Display Block Text'
    else
      text = 'Display None Text'
    end

    if (page.has_selector?('#none', :visible => false, :wait => 2))
      puts 'exit'
      return
    end

    puts 'continued'

    wait = Selenium::WebDriver::Wait.new(:timeout => 10) #ignore: Selenium::WebDriver::Error::NoAlertPresentError
    wait.until { page.has_css?("##{css}", :text => "#{text}", :visible => true) }

    #page.has_no_css?("##{css}", :text => "#{text}", :visible => true) would pass where text = "none"

  end


end
