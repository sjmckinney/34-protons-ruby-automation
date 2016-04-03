require_relative('page_objects')

class DemoPage < SitePrism::Page

  attr_accessor :delay

  set_url('')

  section(:ajax_delay, AjaxDelay, '#input')
  section(:menu, TextMenu, '#nav')
  element(:text_display, '#contentTxt')
  section(:radio_buttons, RadioButtons, '#radioBtns')
  section(:click_counter, ClickCounter, '#buttons')
  section(:table, Table, '#table')
  section(:drag_n_drop, DragNDrop, '#Drag-Drop')
  section(:hidden, HiddenText, '#visibleElement')

end