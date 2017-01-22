Rails.application.routes.draw do

	scope '/api' do

		resources :users, only: [:new, :index, :show, :create, :destroy] do

	  		resources :products, only: [:new, :index, :show, :create, :destroy]

		end

	end

end
