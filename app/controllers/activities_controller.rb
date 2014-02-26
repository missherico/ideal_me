class ActivitiesController < ApplicationController
   before_filter :authenticate_user!

  def index
    #take out photos
    @activities = Activity.all
 end

  def new
    @activity = Activity.new
    redirect_to user_dashboard_path(current_user.id)
  end

  def create
    new_activity = params.require(:activity).permit(:category_id, :real_chart_id, :body)
    @activity = Activity.create(new_activity)
    if @activity.real_chart_id == nil
       Interest.create(user_id: current_user.id, activity_id: @activity.id)
    end
    respond_to do |format|
      format.html {redirect_to user_dashboard_path(current_user.id)}
      format.json {render json: @activity}
    end
  end

  def show
    @activity = Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @activity}
    end
     redirect_to user_dashboard_path(current_user.id)
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(params.require(:activity).permit(:category_id, :real_chart_id, :body))
    redirect_to _path
    respond_to do |format|
      format.html
      format.json {render json: @activity}
    end
     redirect_to user_dashboard(current_user.id)
  end

  def destroy
     activity = Adventure.find(params[:id])
     activity.destroy
     redirect_to user_dashboard_path(current_user.id)
  end

end