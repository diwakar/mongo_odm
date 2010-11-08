require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => product_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
    end
  end
end
