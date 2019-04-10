class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  rescue_from Exception, with: :render_error
  rescue_from ActionController::RoutingError,
              ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

  def not_found_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def render_error(exception)
    logger.error(exception) # Report to your error managment tool here
    Rollbar.error(exception)
    render file: "#{Rails.root}/public/500.html", status: 404, layout: false
  end

  def rescue_from_record_not_found(exception)
    logger.error(exception) # Report to your error managment tool here
    Rollbar.error(exception)
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
