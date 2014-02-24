class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :category_id, :realchart_id, :body
  has_many :interests
end
