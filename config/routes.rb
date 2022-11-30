Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/collectors', to: 'collectors#index'
  get '/puzzles', to: 'puzzles#index'
  get '/puzzles/:id', to: 'puzzles#show'
end

