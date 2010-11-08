require 'spec_helper'

module ProductExampleHelpermethod
  def mock_method
     @product = mock(Product)
    
  end
end

  shared_examples_for "authenticate" do
    it "authentication needed" do
        
    end
    
  end
  
describe ProductsController, "when a user browses products he" do
  include ProductExampleHelpermethod
  before(:all) do
  end
 
  it_should_behave_like "authenticate"
  
  it "must be able to browse based on name" do
    mock_method
  end
  
  it "must be able to browse based on category" do
    mock_method
  end
  
  it "must be able to browse based on last updated date" do
    mock_method
    pending("yet to do")
    subject_should say("hello")
  end

  
  
  
end
