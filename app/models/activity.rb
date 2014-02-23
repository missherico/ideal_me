class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :realchart

  has_many :interests
  
end
