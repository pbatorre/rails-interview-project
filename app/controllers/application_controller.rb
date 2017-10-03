class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  def authorize
    if tenant = Tenant.find_by(api_key: request.env['Authorization'])
      tenant.increment!(:request_count)
    else
      head :unauthorized
    end
  end
end
