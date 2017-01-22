class ProductsController < ApplicationController

	def index

		product_list

		render :index
	end

	def create
		
		@producto = user.products.new(product_params)

    	if @producto.save
      		redirect_to "/api/users/#{user.id}/products/#{@producto.id}"
    	else
      		flash[:error] = @user.errors.message
      		render 'new'
    	end

	end

	def new

    	@producto = user.products.new
    	render :new

  	end

	def show

    	if product.present?
      		render :show
    	else
      		render file: 'public/404.html'
    	end
	end

	def destroy

		product.destroy

		redirect_to "/api/users/#{user.id}/products"

	end

	private
	
		def user
    		@user = User.find_by(id: params[:user_id])
  		end

  		def product
  			@producto = user.products.find_by(id: params[:id])
  		end

		def product_list
	    	@productos = user.products.order(created_at: :asc).limit(20)
	  	end

		def product_params
	    	params.require(:product).permit(:title, :description, :deadline)
	  	end
end
