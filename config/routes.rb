Rails.application.routes.draw do
 

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => "users#new"
  get 'general_english' => 'static_pages#GE'
  
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => "sessions#destroy"
  resources :exams do 
    resources :questions do 
      resources :choices
    end
  end
  get 'result' => 'exams#result'
  get 'answer' => 'exams#answer'
  #resources :questions do 
      #resources :choices
  #end


end
