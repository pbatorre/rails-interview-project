class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  def authorize
    if tenant
      tenant.increment!(:request_count)
    else
      head :unauthorized
    end
  end

  private

  def tenant
    @tenant ||= Tenant.find do |tenant|
      ActiveSupport::SecurityUtils.secure_compare(tenant.api_key, auth_param)
    end
  end

  def auth_param
    @auth_param ||= request.env['Authorization']
  end

end
