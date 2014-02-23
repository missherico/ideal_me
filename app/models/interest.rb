# == Schema Information
#
# Table name: interests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  activity_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
end
