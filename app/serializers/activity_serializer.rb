class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :category_id, :real_chart_id, :body
  has_many :interests
end
