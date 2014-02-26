# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  real_chart_id :integer
#  body          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :real_chart

  has_many :interests

  def self.find_by_user_id_and_category_id(user_id, category_id)
    joins(:interests)
      .where('interests.user_id = ?', user_id)
      .where('activities.category_id = ?', category_id)
  end
  
end
