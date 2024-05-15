require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  describe "should use site layout" do
    it 'success' do
      get root_url  
      assert_template layout: 'layouts/site' 
    end
  end
end
