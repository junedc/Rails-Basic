
require 'faker'


100.times.map { 

	fname = Faker::Name.first_name.to_s
	email = Faker::Internet.email.to_s
	anything =  Faker::Number.number(3).to_s

	puts  fname + ',' +  email  + ',' + anything
}