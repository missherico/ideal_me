class ActivitiesController < ApplicationController
  before_filter :signed_in_user, only: [:index]

  def index
    #take out photos
    @activities = Activity.all
 end

  def new
    @activity = Activity.new
    redirect_to users_dashboard
  end

  def create
    new_activity = params.require(:activity).permit(:category_id, :realchart_id, :body)
    @activity = Activity.create(new_activity)
    respond_to do |format|
      format.html
      format.json {render json: @activity}
    end
  end

  def show
    @activity =Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @activity}
    end
     redirect_to users_dashboard
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(params.require(:activity).permit(:category_id, :realchart_id, :body))
    redirect_to _path
    respond_to do |format|
      format.html
      format.json {render json: @activity}
    end
     redirect_to users_dashboard
  end

  def destroy
     activity = Adventure.find(params[:id])
     activity.destroy
     redirect_to users_dashboard
  end

end