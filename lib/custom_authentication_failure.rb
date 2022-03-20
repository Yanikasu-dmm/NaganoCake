  class CustomAuthenticationFailure < Devise::FailureApp
  protected
    def redirect_url
       new_customer_session_path
    end
  end