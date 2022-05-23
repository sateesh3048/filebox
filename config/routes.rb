Rails.application.routes.draw do
  devise_for :users
  resources :documents do
    member do
      get :share
      get :download
    end
  end
  resource :home, controller: 'home' do
    get :about, on: :collection
  end

  get ':doc_url', to: 'documents#shared_document'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  root to: 'documents#index'
end
