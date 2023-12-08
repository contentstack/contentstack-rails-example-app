Rails.application.routes.draw do
  root to: "home#index"
  get '/product/:id' => "product#show"
  post '/product/:id' => "product#add_to_cart"
  get '/category/:id' => "category#show"
  # Catch-all route for 404 errors
  get '*unmatched_route', to: 'errors#not_found'
end
