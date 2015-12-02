# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create :user}

  describe "admin?" do
  let(:admin) {create :admin}
  it "should not be admin" do
    expect(user.has_role?(:admin)).to eq(false)
   end
   it "should be admin" do
     expect(admin.has_role?(:admin)).to eq(true)
   end
  end
  
end
