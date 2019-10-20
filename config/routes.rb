Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    collection do
      get :search
      get :ruby
      get :rails
      get :linux
      get :css
      get :html
      get :javascript
      get :skill
      get :database
      get :upward
    end
  end

  namespace :admin do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
