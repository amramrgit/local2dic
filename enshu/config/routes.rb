Rails.application.routes.draw do
  #get 'blogs/index'
  #get '/blogs', to:'blogs#index'

  #get 'blogs/new'

  #get 'blogs/show'

  #
  resources:blogs do
    #confirm画面の追加
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end