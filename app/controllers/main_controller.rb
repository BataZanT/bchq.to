class MainController < ApplicationController

    def home
        if session[:user_id]
            @user = Current.user
        end
    end
end