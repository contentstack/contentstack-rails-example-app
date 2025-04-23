class ProductController < ApplicationController
  before_action :load_categories

  def show
    @product = $STACK.content_type('product').entry(params[:id]).fetch
  end

  def add_to_cart
    sanitized_id = sanitize(params[:id])
    # redirect_to URI.parse("/product/#{sanitized_id}").path
    redirect_to_product(sanitized_id)
  end

  private

  def load_categories
    @categories = $STACK.content_type('category').query.fetch
  end

  def sanitize(id)
    # Assuming IDs are alphanumeric, sanitize accordingly. Adjust the regex if needed.
    id.to_s.gsub(/[^a-zA-Z0-9_-]/, '')
  end

  def redirect_to_product(sanitized_id)
    product_path = "/product/#{sanitized_id}"
    if product_path_valid?(product_path)
      redirect_to product_path
    else
      render plain: "Invalid product ID", status: :bad_request
    end
  end

  def product_path_valid?(path)
    # Implement validation logic to ensure the path is within the expected domain
    # This is a simple example, adjust based on your actual validation needs
    path.start_with?("/product/")
  end
end
