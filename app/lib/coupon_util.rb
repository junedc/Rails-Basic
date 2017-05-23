class CouponUtil

	def self.instance
		s = CouponUtil.new
		return s
	end

	def isValidCode(couponCode) 

	   promo = Coupon.where(coupon_code: couponCode).first
	   puts promo.active_from

     return true;

	end 


	def displayVariable

        puts 'variable inside lib'
		puts @variable 
		puts 'variable inside lib'
	end	

end