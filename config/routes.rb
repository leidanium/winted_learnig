Rails.application.routes.draw do
  resources :addresses
  resources :articles
  resources :article_attributes
  resources :attributes
  resources :categories

  root to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
