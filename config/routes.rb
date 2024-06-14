Rails.application.routes.draw do
  root to: 'budgets#index'
  resources :accounts
  resources :budgets
end
