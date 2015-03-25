$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler'
Bundler.require
require 'models/google_page'

class ClickIt

  def self.which_university url='http://www.google.co.uk'
    google_page = GooglePage.new(url)
    google_page.search('which university')
    google_page.click_first_result
  end

end
