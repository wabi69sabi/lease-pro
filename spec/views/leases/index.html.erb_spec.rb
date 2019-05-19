require 'rails_helper'

RSpec.describe "leases/index", type: :view do
  before(:each) do
    assign(:leases, [
      FactoryBot.build(:lease),
      FactoryBot.build(:lease)
    ])
  end

  it "renders a list of leases" do
    render
  end
end
