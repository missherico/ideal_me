class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :realcharts
  has_many :idealcharts
  has_many :interests
end
