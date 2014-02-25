class RealChartsController < ApplicationController
   before_filter :authenticate_user!

   def index 
    @realcharts = RealChart.all
   end

   def create
    @realchart = RealChart.create(user_id: current_user.id) 
   end

   def new
    @realchart = RealChart.new
   end
  
	


end
