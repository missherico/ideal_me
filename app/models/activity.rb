# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  realchart_id :integer
#  body         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :realchart

  has_many :interests
  
end
