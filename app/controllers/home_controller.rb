class HomeController < ApplicationController
  before_action :load_categories
  def index
    @products = $STACK.content_type('product').query.fetch
  end

  private
  def load_categories
    @categories = $STACK.content_type('category').query.fetch
  end
end
