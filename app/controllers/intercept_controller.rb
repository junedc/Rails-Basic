class InterceptController < ApplicationController


  skip_before_action :verify_authenticity_token

  def index
  end

  def methodtobeintercepted
    puts 'this method should not run'
    puts 'this method should not run'
    puts 'this method should not run'
    puts 'this method should not run'

  end


  def anothermethod
    puts 'this method should run'
    puts 'this method should run'
    puts 'this method should run'
    puts 'this method should run'
  end
end