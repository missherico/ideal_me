class EditRealChartIdColumnToActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :realchart_id, :real_chart_id

  end
end
