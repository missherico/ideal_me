require 'spec_helper'

describe User do
	it 'has a valid factory' do
	  FactoryGirl.create(:user).should be_valid
  end
	it 'is invalid without a first_name'
	it 'is invalid without a last_name'
	it 'is invalid without a password'

end