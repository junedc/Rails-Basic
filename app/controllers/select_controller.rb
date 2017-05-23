class SelectController < ApplicationController


  def index

  end


  def selectjson

    query = params[:term]

    #whole word
    #examples = Example.where(city: dbParam )


    examples = Example.where("city LIKE ?", "%#{query}%")


    render json: examples
  end


  def selectjsontest


    examples = Selectx.all
    @cities = Selectx.all
    @examples = examples.as_json

  end
end
