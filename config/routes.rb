Rails.application.routes.draw do
  resources :ingredients, path: :ingrediente, defaults: { format: :json }

  resources :burgers, path: :hamburguesa, defaults: { format: :json }do
    resources :ingredients, path: :ingrediente, only: [:update, :destroy],defaults: { format: :json }

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
