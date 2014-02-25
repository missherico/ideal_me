class IdealChartsController < ApplicationController
   before_filter :authenticate_user!

   def index
    @idealcharts = IdealChart.all
   end

   def new
    @idealchart = Idealchart.new
   end

   def create
    new_user_id = params[:user_id] 
    new_idealchart = params.require(:ideal_chart).permit(:health_score, :social_score, :intellect_score)
    @idealchart = IdealChart.create(new_idealchart)
    @idealchart[user_id] = new_user_id
    @idealchart.save
    respond_to do |format|
      format.html
      format.json {render json: @idealchart}
    end
   end

  

   def update
    @idealchart = IdealChart.find(params[:id])
    @idealchart.update_attributes(params.require(:ideal_chart).permit(:health_score, :social_score, :intellect_score))
    respond_to do |format|
      format.html
      format.json {render json: @idealchart}
    end
     redirect_to user_dashboard(current_user.id)
   end

   def show
     @idealchart =IdealChart.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @idealchart}
    end
     redirect_to user_dashboard_path(current_user.id)
   end

end
