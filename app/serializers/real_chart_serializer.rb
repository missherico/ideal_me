class RealChartSerializer < ActiveModel::Serializer
  attributes :id
  has_many :activities
end
