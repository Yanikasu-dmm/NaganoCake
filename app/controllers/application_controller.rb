class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  # def configrure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  # end
end
