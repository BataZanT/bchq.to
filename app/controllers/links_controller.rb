class LinksController < ApplicationController
require "digest/sha2"
    
    def new
        @link = Link.new
    end
    
    def type_link
    end

    def new_private
        @link= PrivLink.new
    end

    def create_private
        @link = PrivLink.new(link_params)
        basic_attributes(@link)
        @link.password = params[:password]
        if @link.save
            redirect_to my_links_path, notice: "Private link shortened successfully"
        else
            render new_private
        end
    end
    
    def new_one_time
        @link= OneTLink.new
        end

    def create_one_time
        @link = OneTLink.new(link_params)
        basic_attributes(@link)
        if @link.save
            redirect_to my_links_path, notice: "One-time link shortened successfully"
        else
            render new_one_time
        end
    end

    def new_temporary
        @link= TempLink.new
    end

    def create_temporary
        @link = TempLink.new(link_params)
        basic_attributes(@link)
        @link.exp_date = params[:exp_date]
        if @link.save
            redirect_to my_links_path, notice: "Temporary link shortened successfully"
        else
            render new_temporary
        end
    end

    def create
        @link = Link.new(link_params)
        basic_attributes(@link)
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
        redirect_to @link.url, allow_other_host: true
    end

    private
    def link_params
        params.require(:link).permit(:title,:url)
    end

    def basic_attributes(link)
        link.user_id = Current.user.id
        link.slug = Digest::SHA2.hexdigest(@link.url) [0..7]
    end

end