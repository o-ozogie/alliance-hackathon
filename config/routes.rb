Jets.application.routes.draw do
  post '/login', to: 'users#login'
  get '/logs', to: 'logs#show'
  post '/logs', to: 'logs#visit'
  get '/information', to: 'users#show'
  put '/information', to: 'users#update'
  get '/spot/:spot_id', to: 'spots#show'
  get '/alerts', to: 'infections#alert'
  post '/infection', to: 'infections#infected'
end
