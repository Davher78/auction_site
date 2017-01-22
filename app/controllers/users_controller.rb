class UsersController < ApplicationController

	def new

    	@user = User.new
    	render :new

  end

  def index

      @users = User.order(created_at: :asc).limit(20)
      render :index

  end

	def show

    	@user = User.find_by(id: params[:id])
    	if @user.present?
      		render :show
    	else
      		render file: 'public/404.html'
    	end

  	end

	def create

    	@user = User.new(user_params)

    	if @user.save
      		redirect_to "/api/users/#{@user.id}"
    	else
      		flash[:error] = @user.errors.message
      		render 'new'
    	end

  	end

	def destroy

		user.destroy
		redirect_to '/api/users/'

	end

	private

		  def user_params
	    	params.require(:user).permit(:nombre, :email)
	  	end

	  	def user_id
	    	params[:id]
	  	end

	  	def user
	    	@user = User.find_by(id: user_id)
	  	end

end
