Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :area_aluno do
    resources :agenda_alunos, path: :agenda
    resources :docentes
    resources :meus_dados
  end
  resources :interesse_alunos

  resources :agenda_professores do
    get :busca_professores_disciplina, on: :collection
  end
  resources :professores
  resources :areas
  resources :disciplinas
  resources :escolaridades
  resources :municipios do
    get :autocomplete, on: :collection
  end
  resources :paises

  resources :principal, only: [:index]
  resources :alunos
  resources :estados
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "principal#index"
end
