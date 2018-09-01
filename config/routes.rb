Rails.application.routes.draw do
  root :to => "jobs#index"
  resources :users
  resources :jobs do
  	collection do
  		post :get_skills
  		get :apply
  		post :apply_for_job
  		get :user_jobs
  		get :applied_jobs
  		get :schedule_interview
  		post :schedule_interview_update
  		get :scheduled_interview
  	end
  end
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
