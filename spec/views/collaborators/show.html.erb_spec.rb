require 'rails_helper'

RSpec.describe "collaborators/show", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :user => nil,
      :wiki => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
