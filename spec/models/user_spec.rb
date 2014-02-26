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

require 'spec_helper'

describe User do
	it 'has a valid factory' do
	  FactoryGirl.create(:user).should be_valid
  end
	it 'is invalid without an email' do
	  FactoryGirl.build(:user, email: nil).should_not be_valid
	end
	it 'is valid without a first_name' do
	  FactoryGirl.build(:user, first_name: nil).should be_valid
	end
	it 'is valid without a last_name' do
	  FactoryGirl.build(:user, last_name: nil).should be_valid
	end
	it 'is invalid without a password' do
		FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it 'has confirmed password' do
		FactoryGirl.build(:user, password_confirmation: 'foobarbar').should be_valid
  end

end
