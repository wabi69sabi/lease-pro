require 'rails_helper'

RSpec.describe Lease, type: :model do
  before :each do
    @user = FactoryBot.build(:user)
    @lease = FactoryBot.build(:lease)
  end

  describe "Associations" do
    it "should allow users to be added to lease" do
      @lease.users << @user
      expect(@lease.users.first).to eq(@user)
    end
  end
end
