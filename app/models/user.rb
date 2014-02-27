# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :real_charts
  has_many :ideal_charts
  has_many :interests
  has_many :activities, through: :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable      

  after_create :welcome_email


  def welcome_email
    SignupMailer.signup(self).deliver
  end  

  def last_activity_date
    #if the user hasn't entered anything for ideal chart or hasn't entered an activity
    # return the time they signed in
    if self.real_charts.empty? ||  self.real_charts.joins(:activities).empty?
      return self.created_at
    else 
      # else find the time of the last activity entered
      return self.real_charts.joins(:activities).last.created_at
    end 
  end


  def recently_active?
     time_since_last_activity = Time.now - last_activity_date
     # 5 days = 432,000 seconds, if the time they were last active is less than 5 days, return true
     # else return false
      return (time_since_last_activity < 432000)
  end

  def weekday_of_last_activity_date
    number_of_day = last_activity_date
    case number_of_day
    when 0
      return "Sunday"
    when 1
      return "Monday"
    when 2
      return "Tuesday"
    when 3
      return "Wednesday" 
    when 4
      return "Thursday"
    when 5
      return "Friday"
    else
      return "Saturday" 
    end
  end
      






end
