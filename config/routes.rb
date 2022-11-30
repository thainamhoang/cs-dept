Rails.application.routes.draw do
  resources :students
  resources :requirements do
    collection do
      get :computer_science
      get :data_science_analytics
    end
  end
  resources :courses
  resources :faculties
  root "department#index"
  get "department/about"

  get "requirements/computer_science"
end
