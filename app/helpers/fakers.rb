
require 'faker'


1100.times.map { 

	firstname = Faker::Name.first_name.to_s
	lastname = Faker::Name.last_name.to_s
	email = Faker::Internet.email.to_s
	username =  Faker::Number.number(10).to_s
	department = Faker::Job.field
	password = Faker::Number.number(10).to_s

	puts  firstname + ',' +  lastname  + ',' + email + ',' + username  + ',' + department + ',' + password
}