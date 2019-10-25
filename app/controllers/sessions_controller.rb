class SessionsController < ApplicationController
    
    skip_before_action :authenticated, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            #byebug
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "Email or password is incorrect."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete(:user_id)
    end
end
