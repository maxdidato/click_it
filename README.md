ClickIt
======
ClickIt is a simple application written for an unattended test.
Once executed it searches on Google for the string 'which university' and clicks on the
first result, showing the content to the user

Requisites
======
ClickIt uses Ruby 2.2.0

Installation

After cloning the repository on your local machine, cd to the project root directory and install all the dependencies by
typing
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
------------
rake which_university[http://otherurl.com]