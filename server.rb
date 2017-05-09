require 'sinatra'
require 'httparty'
require 'nokogiri'

get '/' do
  url = "https://miami.craigslist.org/search/mdc/jjj?query=#{params["job"]}"
  response = HTTParty.get url

  # response.body
  dom = Nokogiri::HTML(response.body)

  dom.css(".hdrlnk").map do | a |
    a.content + "</br>"
  end
end
