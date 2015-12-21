class Coupon < ActiveRecord::Base
belongs_to :user

validates :verify_code,uniqueness: {case_sensitive: false}


Permit_str = ('a'..'z').to_a
(0..9).each { |n| Permit_str << n.to_s }


def self.generate_cp(quantity,value)
	 quantity.to_i.times do
  	 rand_str = ""
  	 6.times { rand_str << Permit_str[rand(Permit_str.length)]}
  	 cp_code = Time.now.sec.to_s + rand_str
  	 Coupon.create(verify_code: cp_code,value: value,expire_at: (Time.now + 1.month))
  	end
end
  	

end
