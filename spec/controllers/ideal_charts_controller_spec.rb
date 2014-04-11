require 'spec_helper'

describe IdealChartsController do

  describe "GET new" do
  	context "when signed in" do
	  	before(:each) do
	  		# @current_user = mock_model("User")
	  		@request.env['devise.mapping'] = Devise.mappings[:user]
	  		@user = FactoryGirl.create(:user)
	  		sign_in @user

	  		@new_ideal_chart = IdealChart.create(
	  			user_id: @user.id, 
	  			health_score: 20,
	  			social_score: 30,
	  			intellect_score: 50
	  		)

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
	  		expect(RealChart.find_by(user_id: @user.id)).should_not eql(nil)
	  	end

	  	it "should update attributes" do
	  		@new_ideal_chart.update_attributes(
	  			health_score: 30,
	  			social_score: 50,
	  			intellect_score: 20
	  		)

	  		expect(@new_ideal_chart.health_score).to be == 30
	  		expect(@new_ideal_chart.social_score).to be == 50
	  		expect(@new_ideal_chart.intellect_score).to be == 20
	  	end
	  end


	end
end