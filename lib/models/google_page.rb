Capybara.default_driver = :selenium

#MonkeyPatching to leave the browser open
Capybara::Selenium::Driver.class_eval do
    def quit;end
end

class GooglePage
include Capybara::DSL
  attr_accessor :url

  def initialize url
    raise Exception.new('Invalid Url') unless URI.parse(url).kind_of?(URI::HTTP)
    @url=url
  end

  def search string
    visit @url
    query_field = find_field 'q'
    query_field.set string
    query_field.native.send_key(:enter)
  end

  def click_first_result
    within(:css, "div#ires") do
      first(:link).click
    end
  end

end

