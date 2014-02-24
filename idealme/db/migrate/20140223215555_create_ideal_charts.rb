class CreateIdealCharts < ActiveRecord::Migration
  def change
    create_table :ideal_charts do |t|
      t.references :user, index: true
      t.integer :health_score
      t.integer :social_score
      t.integer :intellect_score
      
      t.timestamps
    end
  end
end
