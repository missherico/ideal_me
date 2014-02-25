class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @idealchart = IdealChart.find_by(user_id: @user.id)
  end
end
