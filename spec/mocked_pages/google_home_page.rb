module MockedPages
class GoogleHomePage
  extend Mirage::Template::Model

  endpoint '/google'
  http_method :get
  status 200
  content_type 'text/html'

  builder_methods :perform_search_link

  def body
    File.read("#{ROOT_DIR}/spec/fixtures/google_home_page.html").
        gsub('#link_for_search_results#',"/responses/#{perform_search_link}")
  end
end
end