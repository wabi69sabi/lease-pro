require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.build(:user)
  end

  it "should not be valid without a first_name" do
    @user.first_name = nil
    @user.should_not be_valid
  end

  it "should allow to assign a role" do
    @user.role = "tenant"
    expect(@user.tenant?).to be true
  end

  it "should reject an invalid role" do
    expect { @user.role = "foo" }.to raise_error ("'foo' is not a valid role")
  end
end
