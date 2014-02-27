class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_user_ideal_chart_path(current_user.id)
  end
end