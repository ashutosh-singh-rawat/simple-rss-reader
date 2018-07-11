Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'feeds#index'
  resources :feeds do
    resources :posts, only: [:index, :show]
  end

  get :reader, to: 'feeds#reader', as: :reader
end
