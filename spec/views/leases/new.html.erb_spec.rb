require 'rails_helper'

RSpec.describe "leases/new", type: :view do
  before(:each) do
    assign(:lease, Lease.new())
  end

  it "renders new lease form" do
    # render
    #
    # assert_select "form[action=?][method=?]", leases_path, "post" do
    # end
  end
end
