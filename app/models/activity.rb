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

  mount_uploader :image, ImageUploader
end
