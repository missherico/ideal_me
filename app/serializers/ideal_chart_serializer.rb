class IdealChartSerializer < ActiveModel::Serializer
  attributes :id, :health_score, :intellect_score, :social_score
end
