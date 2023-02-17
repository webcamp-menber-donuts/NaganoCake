class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:fast_name,:kana_last_name,:kana_fast_name,:postal_code,:address,:telephone_number])
  end
end
