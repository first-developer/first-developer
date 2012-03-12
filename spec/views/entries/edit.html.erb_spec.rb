require 'spec_helper'

describe "entries/edit.html.erb" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entries_path(@entry), :method => "post" do
      assert_select "input#entry_title", :name => "entry[title]"
      assert_select "textarea#entry_body", :name => "entry[body]"
      assert_select "input#entry_published", :name => "entry[published]"
    end
  end
end
