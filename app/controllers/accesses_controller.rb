class AccessesController < ApplicationController

    def index
        @link = Link.find_by(id:params[:id])
        @accesses = @link.accesses
    end

end