Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root :to => 'users#index'
  resources :users
  resources :tests, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
