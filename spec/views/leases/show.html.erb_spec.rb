require 'rails_helper'

RSpec.describe "leases/show", type: :view do
  before(:each) do
    @lease = assign(:lease, FactoryBot.build(:lease))
  end

  it "renders attributes in <p>" do
    render
  end
end
