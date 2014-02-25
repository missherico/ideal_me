module ValidUserRequestHelper
  
  def sign_in_as_a_valid_user
    @user = User.create({
    	  email: 'test@domain.com',
    	  password: 'password',
    	  password_confirmation: 'password'})

    post_via_redirect user_session_path,
      'user[email]' => @user.email, 'user[password]' => @user.password
  end

end