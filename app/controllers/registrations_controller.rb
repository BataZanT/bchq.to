class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Account created successfully"
        else
            render :new
        end
    end

    def goodbye
        require_user_logged_in!
    end
    def destroy
        require_user_logged_in!
        User.destroy_by(id: Current.user.id)
        redirect_to my_links_path, notice: "Account deleted successfully"
    end

    private
    def user_params
        params.require(:user).permit(:username,:mail,:password,:password_confirmation)
    end


end