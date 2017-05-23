class SpecialController < ApplicationController

  require_dependency("shop")
  require 'jbuilder'


  #https://www.codecademy.com/en/forum_questions/534dbd327c82ca9c53000440


  def show
    @article = Article.find(params[:id])


    myHashMap = {
        basic: [1, "one"],
        ultimate: [2, "two"],
        grand: [3, "three"]
    }


    @hashValue = myHashMap[:basic][0] # to get 1
    @hashValue = myHashMap[:basic][1] # to get one


    key = 'grand'

    if myHashMap[key.to_sym].nil?

    else
      @otherValue = myHashMap[key.to_sym][1]
    end


    @city = "hello"

    #examples = Example.order("RAND()").first(5)


    #Example.order("RAND()").first(2) do | dummyOrder |

    Example.all.each do |dummyOrder|


      @city = dummyOrder.city
      @latitude = dummyOrder.latitude
      @longtitude = dummyOrder.longtitude
      @id = dummyOrder.id.to_s + " minutes"


      articles = Article.all
      @myArticle = articles[rand(0..(articles.length-1))]

      @articleSize = articles.length

    end


    randomId = rand(10000000..99999999)
    @orderId = "E" + randomId.to_s


    myFunction(nil)

    @number = 34.45
    @number = @number.round

    @Timeis = Time.now.strftime('%FT%T%:z')

    ###  Hashing


    ##convert model to hashmap
    key = 3
    articles = Article.all
    articleMap = articles.map {|c| [c.id, c]}.to_h
    myArticle = articleMap[key]

    puts "myarticle2"
    puts myArticle.title
    puts "myarticle2"


    artMap = Article.all.map(&:attributes)
    puts artMap


    #checking for null
    shop = Shop.where(shopify_domain: 'watch-people-shop-localhost.myshopify.com')
    puts shop


    validCode = CouponUtil.instance.isValidCode('6monthsfree')
    puts validCode


    #http://stackoverflow.com/questions/7316656/how-to-get-query-string-from-passed-url-in-ruby-on-rails
    vars = request.query_parameters
    paramId = vars['id']

    if paramId == nil
      puts 'Parameter is null'
    end


    puts 'initializing params '
    params = {}

    params['coupon'] = '6monthfree' #adding value to hash param

    puts params


    key = '6monthsfree'

    #coupon = Coupon::where(coupon_code: key, date_deleted: nil, active_to: nil , 'active_to <='  Time.zone.parse("12am")).first


    coupon = Coupon.find_by_sql("select *  from app_coupon where coupon_code = '" + key + "' and date_deleted is null
                                      and 1 = (CASE 
                                          WHEN ((date_created +  INTERVAL FREE_TRIAL_LENGTH DAY)  > curdate())  THEN 1 
                                          WHEN (FREE_TRIAL_LENGTH = 0)  THEN 1 
                                      ELSE 0        
                                      END) 
                                      and (active_to is null or active_to <= curdate())")

    puts 'length'
    puts coupon.length
    puts 'length'

    if coupon == nil
      puts 'coupon is nil'


    else
      puts coupon[0].coupon_code
      puts coupon[0].public_description
      puts 'coupon is not nil'
    end


    #http://stackoverflow.com/questions/22255476/rails-formatting-date
    lastOrderDate = DateTime.now - 90.days
    #@orderItems = ShopifyAPI::Order.find(:all, params: { :created_at_min => lastOrderDate.strftime('%FT%T%:z') } )


  end


  def createshop

    #http://stackoverflow.com/questions/3795024/ruby-how-can-i-access-local-variables-outside-the-do-end-loop
    outerShop = nil

    #http://stackoverflow.com/questions/15363329/find-or-initialize-by-doesnt-work-with-2-columns
    Shop.where(shopify_domain: 'domain.com', deleted_at: nil).first_or_create do |shop|
      shop.shopify_token = '123'
      shop.save!
      outerShop = shop
    end

    puts outerShop.id

  end


  def camelCase

    ### View should be camelCase.html.erb  inside special folder

  end


  def findinitby

    shop = Shop.find_or_initialize_by(shopify_domain: 'domain.com', deleted_at: nil)
    shop.shopify_token = '123'
    shop.save!

  end

  def convertTableToMap
    #convert products to map to be used when getting product later
    products = ShopifyAPI::Product.find(:all)
    @productMap = products.map {|c| [c.id, c]}.to_h


    #use it by
    product = @productMap[productid]
  end

  #http://guides.rubyonrails.org/layouts_and_rendering.html   
  #same controller diffent view
  def renderdiffviewsamecont
    render 'createshop'
  end

  #http://guides.rubyonrails.org/layouts_and_rendering.html
  #render different view with different controller
  def renderdiffviewdiffcont
    @article = Article.find(1)
    render 'articles/show'
  end


  def getrandomrecord

    #working
    @example = Example.order("RAND()").first(1).first


    #another example
    examples = Example.all
    index = rand(0..examples.length)
    @example = examples[index]


    render 'example/show'

  end

end
