require 'spec_helper'

describe ActivitiesController do

  describe "GET new" do
  	context "when signed in" do
	  	before do
	  		@request.env['devise.mapping'] = Devise.mappings[:user]
	  		@user = FactoryGirl.create(:user)
	  		sign_in @user

	  		@activity = mock_model("Activity")
	  		allow(Activity).to receive(:activity).and_return(@activity)
	  		@real_chart = mock_model("RealChart")
	  	end

			# it "should assign @activity" do
	  	# 	rc = RealChart.create(user_id: @user.id)
	  	# 	get new_real_chart_activity_path(rc.id)
	  	# 	#checks if @activity is an instance of an Activity
	  	# 	expect(assigns(:activity)).to eq(@activity)
	  	# end

	  	it "should redirect_to :user_dashboard template" do
	  		get new_real_chart_activity_path
	  		expect(response).to == "302"
	  	end
		end
	end
end


