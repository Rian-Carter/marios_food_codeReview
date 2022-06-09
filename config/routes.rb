# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   root to: 'products#index'
#   resources :products do
#     resources :reviews, :except => [:index]
#   end
# end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#home'
  resources :products do
    resources :reviews
  end
end
