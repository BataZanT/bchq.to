class MainController < ApplicationController

    def home
        if session[:user_id]
            @user = User.find_by(id: session[:user_id]) 
        end
    end
end