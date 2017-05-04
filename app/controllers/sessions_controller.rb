class SessionsController < ApplicationController

def index
	@user = User.find_by_id(session[:user_id])
	# binding.pry
end

def new
end

def create
	# binding.pry	
	@user = User.find_by(name: params[:name])
	if @user != nil
    return redirect_to(controller: 'sessions', action: 'new') unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to controller: 'sessions', action: 'index'
    # binding.pry
	else
	redirect_to controller: "users", action:'new'
	end
    # binding.pry
end

def destroy
	session.delete :user_id
	redirect_to '/login'
end


end
