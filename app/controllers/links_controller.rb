class LinksController < ApplicationController

    def new
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        @link.user_id = Current.user.id
        if @link.save
            redirect_to my_links_path, notice: "link shortened successfully"
        else
            render:new
        end
    end

    def index
        @links = Link.where(user_id: Current.user.id)
    end


    def use
        @link = Link.find_by(slug:params[:slug])
        @link.uses += 1
        @link.save
        redirect_to link.url
    end
    private
    def link_params
        params.require(:link).permit(:title,:url)
    end


end