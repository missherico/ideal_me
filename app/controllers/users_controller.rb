class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @idealchart = IdealChart.find_by(user_id: @user.id)
    gon.user_id = current_user.id
    gon.watch.idealchart = @idealchart.attributes
    interests = Interest.find_by(user_id: @user.id)
    # @activites
    # gon.interests =  @interests.a
    @activities = Activity.all
    @real_chart = RealChart.find_by(user_id: @user.id)
  end
end
