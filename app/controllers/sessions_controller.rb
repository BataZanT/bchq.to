class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to my_links_path, notice: "Logged in"
        else
            flash[:alert] = "Invalid username or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end
end