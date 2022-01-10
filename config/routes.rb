Rails.application.routes.draw do
  # two new methods:
  # collection
  # member
  resources :restaurants do
    # / restaurants / ..
    collection do
      get :top
    end

    member do
      get :chef
    end

    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
