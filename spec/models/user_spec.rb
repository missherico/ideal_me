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