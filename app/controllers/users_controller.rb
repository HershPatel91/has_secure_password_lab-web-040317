class UsersController < ApplicationController

def new
	@user = User.new()
end

def create
	if user_params[:password] == user_params[:password_confirmation]
	@user = User.create(user_params)
	# binding.pry
	session[:user_id] = @user.id
	redirect_to '/homepage'
	else
		redirect_to '/new'
	end
end




private
 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
