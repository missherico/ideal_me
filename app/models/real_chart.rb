# == Schema Information
#
# Table name: real_charts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class RealChart < ActiveRecord::Base
  belongs_to :user
  has_many :activities

end
