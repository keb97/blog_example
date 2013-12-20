class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # I18n.enforce_available_locales = false

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, 
                                                              :sex, 
                                                              :age, 
                                                              :city, 
                                                              :state, 
                                                              :email, 
                                                              :phone, 
                                                              :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, 
                                                                     :sex, 
                                                                     :age, 
                                                                     :city, 
                                                                     :state, 
                                                                     :email, 
                                                                     :phone, 
                                                                     :password,  
                                                                     :current_password) }
    end
end
