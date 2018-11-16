Rails.application.routes.draw do


  namespace :tools do
    namespace :attendance do
      resources :events, except: [:edit, :show, :update, :new]
  end
        resources :notes
  end
  get 'tools/attendance/event/user', to: 'tools/attendance/events#user'
  get 'tools/attendance', to: 'tools/attendance#index'
  get 'tools/',to: 'tools/tools#index'
  get 'tools/attendance/event/date', to: 'tools/attendance/events#date'

  resource :user, only: [:edit] do
    collection do
     patch 'update_password'
    end
  end

  # Mount action cable(websocket uri)
  mount ActionCable.server => '/cable'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
