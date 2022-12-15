Rails.application.routes.draw do
  resources :students do
    collection do
      get :posters
      get :stories
      get :researchs
      get :clubs
    end
  end

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
end
