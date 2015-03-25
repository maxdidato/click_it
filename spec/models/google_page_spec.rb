require 'spec_helper'

describe GooglePage do

  include_context :mock_server

  describe "#initialize" do


    context 'when initialized ' do

      it 'sets the url passed as parameter' do
        google_url = 'http://www.google.com'
        expect(GooglePage.new(google_url).url).to eq(google_url)
      end
    end


    context 'when initialized with a wrong url' do

      subject { GooglePage.new('non_valid_url') }

      it 'raises an Invalid Url exception' do
        expect { subject }.to raise_error(Exception, 'Invalid Url')
      end
    end
  end


  describe 'features' do

    subject { GooglePage.new('http://localhost:7001/responses/google') }

    context '#search', :type => :feature do

      let(:search_results) { 'search performed' }

      before do
        mock_server.put(MockedPages::GoogleHomePage.new.perform_search_link('/search'))
        mock_server.put('/search', search_results) do
          required_parameters[:q] = /university/
        end
      end

      it 'performs a search on google ' do
        subject.search('university')
        raise "The search has not been performed properly" unless page.has_content?(search_results)
      end

    end


    context '#click_first_result', :type => :feature do

      let(:first_result_content) { 'first result clicked' }
      before do
        mock_server.put(MockedPages::GoogleResultsPage.new.first_result_link('/first_result'))
        mock_server.put('first_result', first_result_content)
      end

      it 'clicks the first result of a Google search' do
        visit 'http://localhost:7001/responses/search'
        subject.click_first_result
        raise "Error while clicking the first result" unless page.has_content?(first_result_content)
      end

    end
  end
end

