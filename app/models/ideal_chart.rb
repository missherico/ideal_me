# == Schema Information
#
# Table name: ideal_charts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  health_score    :integer
#  social_score    :integer
#  intellect_score :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class IdealChart < ActiveRecord::Base
  belongs_to :user

end
