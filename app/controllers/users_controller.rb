class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @idealchart = IdealChart.find_by(user_id: @user.id)
    gon.user_id = current_user.id
    gon.watch.idealchart = @idealchart.attributes

    # JS - ideal interests 
    socialInterests = Activity.find_by_user_id_and_category_id(@user.id, 1)
    healthInterests = Activity.find_by_user_id_and_category_id(@user.id, 2)
    intellectInterests = Activity.find_by_user_id_and_category_id(@user.id, 3)

    idealSocialArray = []
    getBody(idealSocialArray, socialInterests)

    idealHealthArray = []
    getBody(idealHealthArray, healthInterests)

    idealIntellectArray = []
    getBody(idealIntellectArray, intellectInterests)

    gon.idealSocialInterests = idealSocialArray
    gon.idealHealthInterests = idealHealthArray
    gon.idealIntellectInterests = idealIntellectArray
    
    # instances for carrier upload / image upload
    @activities = Activity.all
    @real_chart = RealChart.find_by(user_id: @user.id)

    # JS - real chart
    user_social_activites = Activity.where(real_chart_id: @real_chart.id).where(category_id: 1)
    user_health_activites = Activity.where(real_chart_id: @real_chart.id).where(category_id: 2)
    user_intellect_activites = Activity.where(real_chart_id: @real_chart.id).where(category_id: 3)

    gon.realSocialActivitesCount = user_social_activites.count
    gon.realHealthActivitesCount = user_health_activites.count
    gon.realIntellectActivitesCount = user_intellect_activites.count

    realSocialArray = []
    getBody(realSocialArray, user_social_activites)

    realHealthArray = []
    getBody(realHealthArray, user_health_activites)

    realIntellectArray = []
    getBody(realIntellectArray, user_intellect_activites)

    gon.realSocialActivites = realSocialArray
    gon.realHealthActivites = realHealthArray
    gon.realIntellectActivites = realIntellectArray

    gon.realChart = @real_chart.id

  end


  private

  def getBody(arr, activites)
    activites.each {|item| arr << item.body}
  end


end
