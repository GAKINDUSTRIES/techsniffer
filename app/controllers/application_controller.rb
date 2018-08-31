class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  rescue_from ActionController::RoutingError,
              ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def error_404
    raise ActionController::RoutingError.new(params[:path])
  end

  private

  def rescue_from_record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
