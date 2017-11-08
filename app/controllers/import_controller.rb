class ImportController < ApplicationController

	include CommonUtils

	#to fix authenticity token
	#https://stackoverflow.com/questions/35181340/rails-cant-verify-csrf-token-authenticity-when-making-a-post-request
    skip_before_action :verify_authenticity_token
	require 'csv'




	def index
    end 		


	def slowimport

	 
      csvContent = params[:csv]  

   
      sep = ","
      if (csvContent.include?("\t"))
        sep="\t"
      end

      csvContent = "name" + sep + "email"  + "\n" + csvContent


      csv = CSV.new(csvContent, :headers => true, :header_converters => :symbol, :col_sep => sep)
      rows = csv.to_a.map {|row| row.to_hash}

      rowsInserted = 0
      invalidrows = 0


      invalid_data ||= []


      rows.each do |row|

        begin
          emailtocheck = row[:email]
          validEmail = valid_email(emailtocheck)
          if validEmail

          	user = User.new
          	user.name = row[:name]
          	user.email = row[:email]
          	user.save
            puts 'Valid email for ' + emailtocheck
          else
            puts 'In-valid email for ' + emailtocheck
            invalidrows = invalidrows + 1
            invalid = {
                :name => row[:name],
                :email => row[:email],
                :role => row[:role],
                :reason => 'invalid email'
            }

            invalid_data << invalid
            next #go to next loop
          end
     
        rescue => ex

          invalidrows = invalidrows + 1

          invalid = {
              :name => row[:name],
              :email => row[:email],
              :role => row[:role],
              :reason => ex.message
          }

          invalid_data << invalid
        end


      end #end loop

      render:json => {:message => 'Finished importing users', :inserted => rowsInserted, :invalid => invalidrows, :invalid_data => invalid_data}, :status => 200


	end 	

  def fastimport
        
    #these 3 lines are working
    columns = [:name, :email]
    

    #users = [ ['me', 'me@b.com'], ['sya', 'sya@a.com'] ]
    #User.import columns, users, validate: false

    
    csvContent = params[:csv]  
 
    sep = ","
    if (csvContent.include?("\t"))
      sep="\t"
    end

    csvContent = "name" + sep + "email"  + "\n" + csvContent


    csv = CSV.new(csvContent, :headers => true, :header_converters => :symbol, :col_sep => sep)
    rows = csv.to_a.map {|row| row.to_hash}

    rowsInserted = 0
    invalidrows = 0

    errors = User.import columns, rows, validate: true
    puts 'any errors'
    puts errors
    puts 'errors'

    invalidrows = 5
    invalid_data ||= []
    render:json => {:message => 'Finished importing users', :inserted => 5, :invalid => invalidrows, :invalid_data => invalid_data}, :status => 200

  end   
end
