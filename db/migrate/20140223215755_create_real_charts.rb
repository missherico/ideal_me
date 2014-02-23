class CreateRealCharts < ActiveRecord::Migration
  def change
    create_table :real_charts do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
