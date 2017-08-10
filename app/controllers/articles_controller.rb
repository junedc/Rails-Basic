class ArticlesController < ApplicationController


  def index
    @articles = Article.all
    # @articles = Article.last(2)
  end

  def show
    
    @article = Article.find(params[:id])

    @variable = "hello"

    setupBilling()

    CouponUtil.instance.displayVariable
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def setupBilling
    puts 'variable'
    puts @variable
    puts 'variable'
  end


  def myFunction(passedObj)
    if passedObj
      @objectIsEmpty = false
    else
      @objectIsEmpty = true
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
