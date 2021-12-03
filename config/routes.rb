Rails.application.routes.draw do
  resources :characteristics
  devise_for :users
  resources :addresses
  resources :articles do
    collection do
      get :buy
    end
  end
  resources :article_characteristics
  resources :categories

  root to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
