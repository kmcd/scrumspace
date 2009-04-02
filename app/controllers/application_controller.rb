# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :find_product
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_account_session, :current_account
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '893338604f8f573566ad0ba4b9258249'
  
  private
  
  # TODO: refactor 
  def current_account_session
    return @current_account_session if defined?(@current_account_session)
    @current_account_session = UserSession.find
  end

  def current_account
    return @current_account if defined?(@current_account)
    @current_account = current_account_session && current_account_session.user
  end
  
  def find_product
    @product ||= Product.find_by_name(request.subdomains.first)
  end
  
  def product_url(name)
    request.host.sub /^\w*\.*(scrumspace)/, "#{name}.\\1"
  end
end
