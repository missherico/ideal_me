class ActivitiesController < ApplicationController
  before_filter :signed_in_user, only: [:index]

  def index
    #take out photos
    @activities = Activity.all
 end

  def new
    @activity = Activity.new
  end

  def create
    new_activity = params.require(:activity).permit(:category_id, :realchart_id, :body)
    @activity = Activity.create(new_activity)
    
    #json
  end

  def show
    #json
  end

  def update
    #json
  end

  def destroy
  end

end
