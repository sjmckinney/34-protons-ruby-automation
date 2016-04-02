#This code is run before each scenario in the page_objects.feature file
#It ensures that a valid reference to the @demo_page exists and if not
#a new demo_page object is instantiated.

Before do
  @demo_page ||= DemoPage.new
end