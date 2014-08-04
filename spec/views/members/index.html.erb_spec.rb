require 'rails_helper'

RSpec.describe "members/index", :type => :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :membership_number => 1
      ),
      Member.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :membership_number => 1
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
