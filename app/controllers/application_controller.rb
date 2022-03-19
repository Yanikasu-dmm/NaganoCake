class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource) 
   root_path 
  end 
  
  def after_sign_out_path_for(resource) 
   new_customer_session_path 
  end

  private

  # def configrure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  # end
end
