class AccessesController < ApplicationController

    def index
        @link = Link.find_by(id:params[:id])
        @accesses = @link.accesses
    end

    def index_per_day
        @link = Link.find_by(id:params[:id])
        @hash = {}
        @link.accesses.each do |acc|
            if @hash[acc.date_and_time.to_date].nil?
                @hash[acc.date_and_time.to_date] = 1
            else
                @hash[acc.date_and_time.to_date] += 1
            end
        end

    end

    def index_today
        @link = Link.find_by(id:params[:id])
        @num = @link.accesses.all.select do |acc|
            acc.date_and_time >= Date.today 
        end.length
    end

end