Rails.application.routes.draw do
  root to: 'items#index'
  resources :card, only: [:new, :show] do
  collection do
    post 'show', to: 'card#show'
    post 'pay', to: 'card#pay'
    post 'delete', to: 'card#delete'
  end
end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'

  resources :items
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_deliverywayonSeller', defaults: { format: 'json' }
      get 'get_deliverywayonBuyer', defaults: { format: 'json' }
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
