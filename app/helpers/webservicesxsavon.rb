#http://www.greenacorn-websolutions.com/web-services/creating-a-ruby-soap-client.php

require 'savon'
#require "spec_helper"


client = Savon.client(wsdl: 'http://webservicex.net/currencyconvertor.asmx?wsdl')
puts client.operations
    # calling the api with fromCurrecny and toCurrency unit

#response = client.request :web, :conversion_rate, body: {

response = client.call(:conversion_rate,message: {
                   "FromCurrency" =>     'PHP' , "ToCurrency" => 'NZD'

                  }
                  )

#checking for success of api call

#print response

#this is working fine.  sometimes it returns -1 maybe because of excessive calls to free service

print response.to_hash[:conversion_rate_response][:conversion_rate_result]

