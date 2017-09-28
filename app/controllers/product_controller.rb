class ProductController < ApplicationController
  before_action :load_categories
  def show
    @product = $STACK.content_type('product').entry(params[:id]).fetch
  end

  def add_to_cart
    redirect_to "/product/#{params[:id]}"
  end

  private
  def load_categories
    @categories = $STACK.content_type('category').query.fetch
  end
end
