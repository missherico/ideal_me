class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :realchart
end
