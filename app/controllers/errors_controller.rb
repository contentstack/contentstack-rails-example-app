# app/controllers/errors_controller.rb

class ErrorsController < ApplicationController
    def not_found
      # Your logic to handle the 404 error, for example rendering a 404 page
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
  end
  