FactoryGirl.define do
  factory :item do
    association :product
    association :order
    quantity 1
  end

end
