require 'rails_helper'

RSpec.describe "collaborators/index", type: :view do
  before(:each) do
    assign(:collaborators, [
      Collaborator.create!(
        :user => nil,
        :wiki => nil
      ),
      Collaborator.create!(
        :user => nil,
        :wiki => nil
      )
    ])
  end

  it "renders a list of collaborators" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
