Rails.application.routes.draw do
  post '/rest/verify_user/:email', to: 'users#verify_user'
end
