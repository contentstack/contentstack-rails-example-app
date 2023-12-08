class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from StandardError, with: :handle_internal_server_error

  def handle_internal_server_error(exception)
    # Check if the response status is a 5XX error
    if exception.kind_of?(ActionDispatch::ExceptionWrapper) && [500, 502, 503, 504].include?(exception.status_code)
      # Handle 5XX errors here if needed
      # ...
    else
      # Redirect to the 500.html page for other errors
      render file: "#{Rails.root}/public/50x.html", layout: false, status: :internal_server_error
    end
  end
end
