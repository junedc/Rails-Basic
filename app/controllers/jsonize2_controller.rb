class JsonizeController2 < ApplicationController

  #https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
  require 'net/http'
  require 'json'
  require 'rest-client'
  require 'base64'


  #http://stackoverflow.com/questions/5711190/how-to-get-rid-of-opensslsslsslerror
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


  def jsonoutput

    articles = Article.all

    render json: articles

  end


  def jsonfromurl


    url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    puts response
    render json: JSON.parse(response)

  end


  def jsonwithtoken

    url = 'https://treasure-hunt-test-1-localhost.myshopify.com/admin/pages.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    puts response
    render json: JSON.parse(response)
  end

  def index
    @elements = my_service_client.get_elements
    # now the view will have access to the elements from your service
  end


  #https://www.krautcomputing.com/blog/2015/06/21/how-to-use-basic-authentication-with-the-ruby-rest-client-gem/
  def jsonwithrestclient2
    url = 'https://treasure-hunt-test-1-localhost.myshopify.com/admin/pages.json'
    response = RestClient.get(
        url,
        request, :content_type => :json, :accept => :json, :'x-auth-key' => "mykey")

    render json: JSON.parse(response)


  end

  def jsonwithrestclientxxx
    url = 'https://treasure-hunt-test-1-localhost.myshopify.com/admin/pages.json'
    #response = RestClient::Request.execute method: :get, url: url, user: 'enquiry@flipmind.com', password: 'Sh0pP@rtNNer', headers: {'token' => '1101a9a686f3f7a4bb820dcf6fc97e44-1493868657', 'api-key' => '9be432c960376da0afc20de1df0c701c'}
    response = RestClient::Request.execute method: :get, url: url, username: '0072761f803946fd2fb4910deb605b4a', password: '6360c063f588511fb65ef6f4a5139571'
    render json: JSON.parse(response)
  end

  def jsonwithrestclient
    url = 'https://wps3.myshopify.com/admin/products.json'
    response = RestClient::Request.new(
        :method => :get,
        :url => url,
        :username => '0072761f803946fd2fb4910deb605b4a',
        :password => '6360c063f588511fb65ef6f4a5139571',
        :headers => {:accept => :json,
                     :content_type => :json}
    ).execute
    results = JSON.parse(response.to_str)
    render results
  end

  private

  def my_service_client
    @_my_service_client ||= MyServiceClient.new(TokenStorage)
  end


end