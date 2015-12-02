FactoryGirl.define do
  factory :order do
    buyer "MyString"
    phone "MyString"
    address "MyString"
    association :user
  end

end
