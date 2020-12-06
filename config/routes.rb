Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Root to links the user to landing page, for this case, we have assigned index as the landing page.
  root to: 'cocktails#index'
  # resources automatically creates path for you, only: allows you to path the required routes
  resources :cocktails, only: [:index, :show, :new, :create] do
    # Each Dose contains a instance of cocktail, hence we nest in under cocktails route
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
