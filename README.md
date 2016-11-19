# SitePrism-Playground
Code to demonstrate the use of SitePrism framework in organising code.

Once cloned use `bundle install` to install required gems and `bundle exec cucumber` to run feature file.

Individual scenarios have been tagged and can run selectively using `bundle exec cucumber -t@tagname, @other_tagname`.

SitePrism promotes the use of the Page Object Model (POM). Areas of a page with specific purpose can be grouped into
classes that contains all the code that will interact with and queries the page state. In this way the code organisation
maps onto the physical layout of the page.

Need to find the code that deals with a button or a field? Then identify the class that maps that the object and that is
where it will live.

Each class can contain other "page objects" as class references in the methods _section_ and _sections_ or as references
to _element_ and _elements_ objects.

The "page object" classes are used to compose the page or pages contained in a website or web-app. These page classes in
turn can be incorporated into an object that represents the entire site or app. This single object is instantiated at
runtime and becomes the access point for all calls to test code.

Individual method calls are prefixed with the "page object" name such that calls become fluent and more readable i.e.

`@app_name.page_object_name.method_name(arg)`

In the code within this repo the "page object" classes are contained in the file page_objects.rb.

The object representing the page is defined in the file demo_page.rb. An instance of the "page" is instaniated in the
hooks.rb file which contains code that is called each time a scenario is run. In this way responsibility for creation of
an instance of a page instance is handed off to the Cucumber framework.

**Set up**

There are five configuration parameters specified in the `.env` file in the project root.

**browser**

Select the browser in the tests will be run.

Valid values are;

*chrome*

*firefox*

*internet_explorer*

*edge*

It is technically possible to run tests against safari, opera and phantomjs but it is currently beyond the scope of this project.

**remote**

Whether to run the tests locally or against a client running Selenium server or a Selenium Grid hub.

Valid values are;

*true*

*false*

**app_host**

This is a Capybara construct and is base url against which the tests will be run.

This these tests the url is *http://www.34protons.co.uk/demo_2_0*.

**hub**

This is the url of the system hosting the hub or Selenium server instance.

**platform**

This is used to specify the platform on which the remote tests are to run. The value is used by a Selenium Grid hub to select those nodes are registered with it that are capable of running the tests.
