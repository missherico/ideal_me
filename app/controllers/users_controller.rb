class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @idealchart = IdealChart.find_by(user_id: @user.id)
    gon.user_id = current_user.id
    gon.watch.idealchart = @idealchart.attributes

    gon.socialInterests = Activity.find_by_user_id_and_category_id(@user.id, 1)
    gon.healthInterests = Activity.find_by_user_id_and_category_id(@user.id, 2)
    gon.intellectInterests = Activity.find_by_user_id_and_category_id(@user.id, 3)
  end
end
