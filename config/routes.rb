Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do 
    namespace 'v1' do 
      scope 'products/' do 
        get 'index', to: "products#index"
        post 'create', to: "products#create"
        get 'show/:id', to: "products#show"
        put 'update/:id', to: "products#update"
        delete 'delete/:id', to: "products#delete"
      end
    end
  end
end
