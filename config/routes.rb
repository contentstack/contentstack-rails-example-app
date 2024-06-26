Rails.application.routes.draw do
  root to: "home#index"
  get '/product/:id' => "product#show", as: 'product'
  post '/product/:id' => "product#add_to_cart"
  get '/category/:id' => "category#show", as: 'category'
end
