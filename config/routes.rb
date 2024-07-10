Rails.application.routes.draw do
  root to: 'budgets#index'
  get "budgets/:id/assign", to: "budgets#assign"
  get "budgets/:id/spend", to: "budgets#spend"
  resources :accounts
  resources :budgets
end
