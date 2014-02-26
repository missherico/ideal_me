class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @idealchart = IdealChart.find_by(user_id: @user.id)
    gon.user_id = current_user.id
    gon.watch.idealchart = @idealchart.attributes

    socialInterests = Activity.find_by_user_id_and_category_id(@user.id, 1)
    healthInterests = Activity.find_by_user_id_and_category_id(@user.id, 2)
    intellectInterests = Activity.find_by_user_id_and_category_id(@user.id, 3)

    socialArray = []
    socialInterests.each {|interest| socialArray << interest.body }

    healthArray = []
    healthInterests.each {|interest| healthArray << interest.body}

    intellectArray = []
    intellectInterests.each {|interest| intellectArray << interest.body}

    gon.socialInterests = socialArray
    gon.healthInterests = healthArray
    gon.intellectInterests = intellectArray
    #binding.pry
  end
end
