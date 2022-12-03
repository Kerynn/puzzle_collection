Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/collectors', to: 'collectors#index'
  get '/collectors/new', to: 'collectors#new'
  get '/collectors/:id', to: 'collectors#show'
  get '/puzzles', to: 'puzzles#index'
  get '/puzzles/:id', to: 'puzzles#show'
  get '/collectors/:collector_id/puzzles', to: 'collector_puzzles#index'
  get '/collectors/:collector_id/puzzles/new', to: 'collector_puzzles#new'
  post '/collectors', to: 'collectors#create'
  get '/collectors/:id/edit', to: 'collectors#edit'
  patch '/collectors/:id', to: 'collectors#update'
  post '/collectors/:collector_id/puzzles', to: 'collector_puzzles#create'
end

