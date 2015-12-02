# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "product#{n}"}
    price 500
    inventory 500
    introduction "Text"
    sales 0
  end

end
