class Author < ApplicationRecord

	has_many :posts


   def titles
   	   t = ''
   	   self.posts.each do |p|
            t = t + p.title
   	   end 	
   	   return t
   end 	
end
