class LinksController < ApplicationController



    def new
        @link = Link.new
    end
    
    def type_link
    end

    def new_private
        @link= PrivLink.new
    end

    def create_private
        @link = PrivLink.new(link_params(:priv_link))
        basic_attributes(@link)
        @link.password = params[:priv_link][:password]
        if @link.save
            redirect_to my_links_path, notice: "Private link shortened successfully"
        else
            render :new_private
        end
    end
    
    def new_one_time
        @link= OneTLink.new
        end

    def create_one_time
        @link = OneTLink.new(link_params(:one_t_link))
        basic_attributes(@link)
        if @link.save
            redirect_to my_links_path, notice: "One-time link shortened successfully"
        else
            render :new_one_time
        end
    end

    def new_temporary
        @link= TempLink.new
    end

    def create_temporary
        @link = TempLink.new(link_params(:temp_link))
        basic_attributes(@link)
        @link.expiration_date = params[:temp_link][:expiration_date]
        if @link.save
            redirect_to my_links_path, notice: "Temporary link shortened successfully"
        else
            render :new_temporary
        end
    end

    def create
        @link = Link.new(link_params(:link))
        basic_attributes(@link)
        if @link.save
            redirect_to my_links_path, notice: "Link shortened successfully"
        else
            render:new
        end
    end

    def index
        @links = Link.where(user_id: Current.user.id)
    end


    def use
        @link = Link.find_by(slug:params[:slug])
        case @link.type
        when "TempLink"
            if @link.expiration_date < DateTime.now
                redirect_to my_links_path, status: :not_found
                return
            end
        when "PrivLink"
            redirect_to "/pwd/#{@link.id}"
            return
        when "OneTLink"
            if @link.accesses.size > 0
                redirect_to my_links_path, status: :forbidden
                return
            end
        end
        @access = Access.create(link_id: @link.id, ip:request.remote_ip, date_and_time:DateTime.now)
        redirect_to @link.url, allow_other_host: true
    end

    def priv_validate
        @link = PrivLink.find_by(id:params[:id])
    end

    def auth
        @link = PrivLink.find_by(id:params[:id])
        if @link.authenticate(params[:password])
            @access = Access.create(link_id: @link.id, ip:request.remote_ip, date_and_time:DateTime.now)
            redirect_to @link.url, allow_other_host: true
        else
            @link.errors.add(:password,:incorrect,message:"Incorrect")
            render :priv_validate
        end
    end

    def destroy
        @link = Link.find_by(id: params[:id])
        @link.destroy
        redirect_to my_links_path, status: :see_other

    end

    private
    def link_params(type)
        params.require(type).permit(:title,:url)
    end

    def basic_attributes(link)
        link.user_id = Current.user.id
        link.slug = SecureRandom.hex[0..7]
        while not (Link.find_by(slug:link.slug).nil?)
            link.slug = SecureRandom.hex[0..7]
        end
    end

end