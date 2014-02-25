require 'spec_helper'

describe RealChartsController do

  describe "GET new" do
  	context "when signed in" do
	  	before do
	  		sign_in_as_a_valid_user
	  		@real_chart = mock_model("RealChart")
	  		allow(RealChart).to receive(:real_chart).and_return(@real_chart)
	  	end

	  	it "should assign @real_chart" do
	  		get new_user_real_chart_path
	  		#checks if @activity is an instance of an Activity
	  		expect(assigns(:real_chart)).to eq(@real_chart)
	  	end

	  	# it "should redirect_to :user_dashboard template" do
	  	# 	get new_real_chart_activity_path
	  	# 	expect(response).to == "302"		
	  	# end
	  end


	end
end