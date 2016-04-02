require_relative('page_objects')

class DemoPage < SitePrism::Page

  set_url('')

  section(:radio_buttons, RadioButtons, '#radioBtns')
  section(:click_counter, ClickCounter, '#buttons')
  section(:table, Table, '#table')
  section(:drag_n_drop, DragNDrop, '#Drag-Drop')
  section(:hidden, HiddenText, '#visibleElement')

end