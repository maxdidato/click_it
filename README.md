ClickIt
======
ClickIt is a simple application written for an unattended test.
Once executed it searches on Google for the string 'which university' and clicks on the
first result, showing the content to the user

Requisites
======
ClickIt uses Ruby 2.2.0

Installation
======

After cloning the repository on your local machine, cd to the project root directory and install all the dependencies by typing

------------
    bundle install

To run all the specs type

------------
    rake
 
**Example Usage:**
By default the application uses the url http://www.google.co.uk

------------
    rake which_university

If you wish to use a different url, use the following

-------
    rake which_university[http://otherurl.com]


Notes
======
The application uses Capybara with Selenium WebDriver to interact with the browser
As Selenium doesn't provide a way to keep the browser alive after the execution of the Thread
a workaround is provided by monkey patching the method Driver#quit.
An usage of the refinement would have been interesting but the keyword using applies the
refinement only withing the code block in which is defined. As the Driver#quit method is called by Capybara
the general monkey patching strategy has been preferred.

All the behavioural test use a mock server to stub the google.co.uk page