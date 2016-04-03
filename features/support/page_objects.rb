#Collection of page Objects on http://www.34protons.co.uk/demo_2_0/

class AjaxDelay < SitePrism::Section

  element(:delay_input, '#inputDelay')
  element(:delay_indicator, '#delayIndicator')

  def input_delay(delay)

    delay_input.set(delay)

  end

end

class TextMenu < SitePrism::Section

  elements(:category_menu_btns, '.menuParent')
  elements(:category_sub_menu_btns, '.menuParent li a')
  elements(:menu_items, '.menuParent li a')

  def select_menu_item(item_text, sub_menu_text, menu_text)

    category_menu_btns.each do |menu_btn|

      if(menu_btn.text == menu_text)

        menu_btn.click

        if(sub_menu_text.empty?)

          select_item(item_text)

        else

          category_sub_menu_btns.each do |sub_menu|

            if(sub_menu.text==sub_menu_text)

              sub_menu.hover
              select_item(item_text)

            end

          end

        end

      end

    end

  end

  def select_item(item_text)

    menu_items.each do |item|

      if(item.text == item_text)

        item.click

      end

    end

  end

end


class TextDisplay < SitePrism::Section

  element(:delay_input, '#inputDelay')
  elements(:category_menu_btns, '.menuParent')
  elements(:category_sub_menu_btns, '.menuParent li ul')
  elements(:menu_items, '.menuParent li a')

  def select_menu_item(menu_text, sub_menu_text, item_text)

    category_menu_btns

  end

end

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

    #debug: page.has_selector?(:xpath, globe_icon.path, :wait => 2)

    r = 0..repetitions.to_i
    r.each { |i| globe_icon.drag_to(drag_target) }

    #debug: page.has_selector?(:xpath, "#{drag_target.path}/img", :wait => 1)

  end

  def get_number_dragged

    counter.text.delete('-').strip

  end

end

class HiddenText < SitePrism::Section

  element(:display_block, '#block')
  element(:display_none, '#none')

  def is_visible(css)

    #wait = Selenium::WebDriver::Wait.new(:timeout => 5) #ignore: Selenium::WebDriver::Error::NoAlertPresentError
    #wait.until { page.has_css?("##{css}", :text => "#{text}", :visible => true) }

    if(css == 'block')
      text = 'Display Block Text'
      page.has_selector?('#block', :visible => true) &&
      page.has_selector?('#block', :visible => false) &&
      page.has_css?('#block', :text => "#{text}", :visible => true) &&
      page.has_css?('#block', :text => "#{text}", :visible => false)
    else
      text = 'Display None Text'
      page.has_css?('#none', :text => "#{text}", :visible => false) &&
      page.has_no_css?('#none', :text => "#{text}", :visible => true) &&
      page.has_selector?('#none', :text => "#{text}", :visible => false) &&
      page.has_no_selector?('#none', :text => "#{text}", :visible => true)
    end

=begin

  #block element is always visible (<p style="display: block;" id="block"><i>Display Block Text</i></p>)

  hence

  (NOTE: the value of visible has not effect only whether 'has_selector?' or 'has_no_selector?')

  page.has_selector?('#block', :visible => false, :wait => 2)
  => true

  page.has_selector?('#block', :visible => true, :wait => 2)
  => true

  page.has_no_selector?('#block', :visible => false, :wait => 2)
  => false

  page.has_no_selector?('#block', :visible => true, :wait => 2)
  => false

  #none element is always hidden (<p style="display: none;" id="none"><i>Display None Text</i></p>)

  hence

  (NOTE: the value of visible has an equal but opposite effect on both 'has_selector?' or 'has_no_selector?')

  page.has_selector?('#none', :visible => false, :wait => 2)
  => true

  page.has_no_selector?('#none', :visible => true, :wait => 2)
  => true

  page.has_selector?('#none', :visible => true, :wait => 2)
  => false

  page.has_no_selector?('#none', :visible => false, :wait => 2)
  => false

=end

    #wait = Selenium::WebDriver::Wait.new(:timeout => 5) #ignore: Selenium::WebDriver::Error::NoAlertPresentError
    #wait.until { page.has_css?("##{css}", :text => "#{text}", :visible => true) }

    #debug: page.has_no_css?("##{css}", :text => "#{text}", :visible => true) would pass where text = "none"

  end


end
