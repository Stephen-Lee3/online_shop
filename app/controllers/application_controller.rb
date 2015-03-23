# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?

 
 private
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :nick_name
  end
  
  # not finish i18n
  def set_locale
   	  I18n.locale = params[:locale] || I18n.default_locale
   end

   def find_cart
     unless current_user.cart
       Cart.create(user_id: current_user.id)
     end
   end
end
