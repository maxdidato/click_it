require 'spec_helper'

describe ClickIt do


  describe '.which_university' do

    let(:google_page) do
      google_page = double(GooglePage)
      allow(google_page).to receive(:search)
      allow(google_page).to receive(:click_first_result)
      google_page
    end


    context 'when called with no params' do
      it 'it uses http://wwww.google.co.uk as default url' do
        expect(GooglePage).to receive(:new).with('http://www.google.co.uk').and_return(google_page)
        ClickIt.which_university
      end
    end

    context 'when called with an url' do
      it 'it uses the custom url' do
        expect(GooglePage).to receive(:new).with(:custom_url).and_return(google_page)
        ClickIt.which_university(:custom_url)
      end
    end
  end


  context "when invoked", :type => :feature do
    include_context :mock_server

    let(:expected_response){'first result clicked'}
    let(:first_result_link){'/first_result'}

    before do
      mock_server.put(MockedPages::GoogleHomePage.new.perform_search_link('/search'))

      mock_server.put(MockedPages::GoogleResultsPage.new.first_result_link(first_result_link)) do
        required_parameters[:q] = /which university/
      end

      mock_server.put(first_result_link, expected_response)
    end

    it 'performs a search on google for "which university and clicks the first result' do
      ClickIt.which_university 'http://localhost:7001/responses/google'
      raise Exception unless Capybara.current_session.has_text?(expected_response)
    end
  end


end

