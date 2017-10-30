class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :ready_for_checkout?
  
  def ready_for_checkout?
    @cart.status == 'not submitted'
  end
end
