# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
  sequence(:nick_name){|n| "man#{n}"}
  sequence(:email){|n| "#{n}@qq.com"}
  password "123456"
  password_confirmation "123456"
  address "xx street"
  phone "16060606060"
  real_name "Mike"
   factory :admin do 
      roles {[create(:admin_role)]}
   	 end
  end

end
