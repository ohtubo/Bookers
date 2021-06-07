Rails.application.routes.draw do
<<<<<<< HEAD

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  get 'top' => 'homes#top'

  get 'books' => 'books#index'

  get 'books/:id' => 'books#show', as: 'booklist'

  post 'books' => 'books#create'

  get 'books/:id/edit' => 'books#edit', as: 'edit_booklist'

  patch 'books/:id' => 'books#update', as: 'update_booklist'
  
  delete 'books/:id' => 'books#destroy', as: 'destroy_bookslist'


=======
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :blogs
>>>>>>> origin/main
end
