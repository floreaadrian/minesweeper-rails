Rails.application.routes.draw do
  root      'static_pages#home'
  resources :minesweeper_boards, only: [:new, :create, :index, :show]
end
