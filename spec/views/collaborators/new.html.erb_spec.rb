require 'rails_helper'

RSpec.describe "collaborators/new", type: :view do
  before(:each) do
    assign(:collaborator, Collaborator.new(
      :user => nil,
      :wiki => nil
    ))
  end

  it "renders new collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborators_path, "post" do

      assert_select "input#collaborator_user_id[name=?]", "collaborator[user_id]"

      assert_select "input#collaborator_wiki_id[name=?]", "collaborator[wiki_id]"
    end
  end
end
