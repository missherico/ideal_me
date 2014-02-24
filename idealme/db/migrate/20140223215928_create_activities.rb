class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :category, index: true
      t.references :realchart, index: true
      t.string :body

      t.timestamps
    end
  end
end
