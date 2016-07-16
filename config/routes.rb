Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }

  resources :users
  scope :users do
    get :reviews, to: 'reviews#user_reviews', as: :user_reviews
  end

  resources :quotes
  resources :movies do
    resources :reviews

    collection do
      get :sort
    end
  end
end
