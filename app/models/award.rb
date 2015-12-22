class Award < ActiveRecord::Base
 Base = 10000

 def self.judge(user)
 	 awards = Award.where("expire_at > ?",Time.now)
     total_odds = 0
  	 awards.each {|a| total_odds += a.odds}
  	 rand_num = rand(Base)

  	 if rand_num < total_odds
  	    flag = 0
  	    rand_num = rand(total_odds)
  	    awards.each do |a|
          award_range = (flag...(flag+a.odds))
          if award_range.include?(rand_num)
             user.award_items.create(name: a.name,expire_at: a.expire_at)
             a.update_attributes(quantity: a.quantity - 1)          
             return a.name
          else
          	flag = flag + a.odds
          end
  	    end
  	 else
  	  random_coupon(user.id)	
  	 end
 end

private
 def self.random_coupon(user_id)
 	rand_num = rand(100)
 	if rand_num < 25
 	   value = rand(5) + 6 #(6..10)元
 	else
 	   value = rand(5) + 1   #(1..5)元
 	end
 	Coupon.generate(1,value,user_id) #生成1张优惠卷
 	return "#{user_id} #{value}"
 end
end
