Rails.application.routes.draw do
  get 'auth/:provider', to: "sessions#create"
 
  root to: 'welcome#show'
end
