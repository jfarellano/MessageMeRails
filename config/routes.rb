Rails.application.routes.draw do
	resources :users do 
  	resources :chats do
  		resources :messages
  	end
  end
end
