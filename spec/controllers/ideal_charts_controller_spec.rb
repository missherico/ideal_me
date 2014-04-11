require 'spec_helper'

describe IdealChartsController do

  describe "GET new" do
  	context "when signed in" do
	  	before(:each) do
	  		# @current_user = mock_model("User")
	  		@request.env['devise.mapping'] = Devise.mappings[:user]
	  		@user = FactoryGirl.create(:user)
	  		sign_in @user

	  	end

	  	# it "should assign @real_chart" do
	  	# 	get new_user_real_chart_path(1)
	  	# 	#checks if @activity is an instance of an Activity
	  	# 	expect(assigns(:real_chart)).to eq(@real_chart)
	  	# end

	  	# it "should redirect_to :user_dashboard template" do
	  	# 	get new_real_chart_activity_path
	  	# 	expect(response).to == "302"		
	  	# end

	  	it "should create RealChart with the creation of IdealChart" do
	  		new_ideal_chart = IdealChart.create(
	  			user_id: @user.id, 
	  			health_score: 20,
	  			social_score: 30,
	  			intellect_score: 50
	  		 )
	  		expect(RealChart.find_by(user_id: @user.id)).should_not eql(nil)
	  	end
	  end


	end
end