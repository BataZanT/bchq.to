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
        @num = @link.accesses.select do |acc|
            acc.date_and_time >= Date.today 
        end.length
    end

    def date_search
        @link = Link.find_by(id:params[:id])
        @accesses = @link.accesses.select do |acc|
            acc.date_and_time.between?(params[:from],params[:to]) || 
            acc.date_and_time.to_date.to_s == params[:from] ||
            acc.date_and_time.to_date.to_s == params[:to]
        end
        render :index
    end

    def ip_search
        @link = Link.find_by(id:params[:id])
        @accesses = @link.accesses.select do |acc|
            acc.ip.include?(params[:ip])
        end
        render :index
    end

end