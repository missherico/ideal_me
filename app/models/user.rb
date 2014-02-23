class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :realcharts
  has_many :idealcharts
  has_many :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
