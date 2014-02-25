require 'spec_helper'

describe 'Users' do 
 
  describe "GET /users/sign_in" do
    it "should be successful" do
      get new_user_session_path
      response.status.should == 200
    end
  end
	
  describe "POST /users/sign_in" do
    it "should be successful" do
    	sign_in_as_a_valid_user
    	response.status.should == 200
    end
  end


end