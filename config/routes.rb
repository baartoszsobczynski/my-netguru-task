Rails.application.routes.draw do
  resources :categories do
    resources :products, except: [:index] do
      resources :reviews
    end
  end

  root 'categories#index'
  devise_for :users, controllers: {registrations: "registrations"}
end
