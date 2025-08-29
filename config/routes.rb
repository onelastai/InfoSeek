Rails.application.routes.draw do
  post '/scan', to: 'scans#create'
end
