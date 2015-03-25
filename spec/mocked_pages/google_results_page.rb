module MockedPages
class GoogleResultsPage
  extend Mirage::Template::Model

  endpoint '/search'
  http_method :get
  status 200

  content_type 'text/html'

  builder_methods :first_result_link

  def body
    File.read("#{ROOT_DIR}/spec/fixtures/google_results_page.html").
        gsub('#first_result_link#',"/responses/#{first_result_link}")
  end
end
end