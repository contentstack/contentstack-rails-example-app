class CategoryController < ApplicationController
  before_action :load_categories
  def show
    query = $STACK.content_type('product').query.contained_in('categories', [params[:id]])
    @products = query.fetch
    render template: 'home/index'
  end

  private
  def load_categories
    @categories = $STACK.content_type('category').query.fetch
  end
end
