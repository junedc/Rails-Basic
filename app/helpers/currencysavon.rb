#http://www.greenacorn-websolutions.com/web-services/creating-a-ruby-soap-client.php

require 'savon'
#require "spec_helper"



url = "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL"
client = Savon.client(wsdl: url)

message = {'FromCurrency' => 'EUR', 'ToCurrency' => 'CAD'}
response = client.call(:conversion_rate, message: message).body

response[:conversion_rate_response][:conversion_rate_result]

puts response