Rails.application.routes.draw do
  root 'burgers#index'

  resources :ingredients, path: :ingrediente

  resources :burgers, path: :hamburguesa do
    resources :ingredients, path: :ingrediente

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
