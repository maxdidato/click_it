require 'mirage/client'
require 'capybara/rspec'
require 'rake'
ROOT_DIR = File.expand_path("#{File.dirname(__FILE__)}/../")
$LOAD_PATH.unshift("#{ROOT_DIR}/lib")
$LOAD_PATH.unshift("#{ROOT_DIR}")
require 'mocked_pages/google_home_page'
require 'mocked_pages/google_results_page'
require 'click_it'

Capybara.default_driver =:selenium

shared_context :mock_server do
  let(:mock_server) do
    mock_server = Mirage.start
    mock_server.clear
    mock_server
  end
end