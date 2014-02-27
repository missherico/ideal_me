class RealChartsController < ApplicationController
   before_filter :authenticate_user!

   def index 
    @realcharts = RealChart.all
   end

   def new
    @realchart = RealChart.new
   end
  

end
