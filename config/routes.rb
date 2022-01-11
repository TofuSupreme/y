Rails.application.routes.draw do
  # two new methods:
  # collection (nesting IS okay)-
  # member (nesting IS NOT okay)
  # the only time we nest is when you need the ID of the URL
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
# the destroy route is outside of the nest because we don't need the ID of the restaurant
  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
