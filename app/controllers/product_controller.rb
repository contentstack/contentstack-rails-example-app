class ProductController < ApplicationController
  before_action :load_categories

  def show
    @product = $STACK.content_type('product').entry(params[:id]).fetch
  end

  def add_to_cart
    sanitized_id = sanitize(params[:id])
    redirect_to "/product/#{sanitized_id}", only_path: true
  end

  private

  def load_categories
    @categories = $STACK.content_type('category').query.fetch
  end

  def sanitize(id)
    # Assuming IDs are alphanumeric, sanitize accordingly. Adjust the regex if needed.
    id.to_s.gsub(/[^a-zA-Z0-9_-]/, '')
  end
end
