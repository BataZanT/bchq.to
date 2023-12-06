class Link < ApplicationRecord
    belongs_to :user 
    has_many :accesses , dependent: :destroy
    validates :title, uniqueness: {scope: :user_id, message: "You alredy have a link with that title"}
    validates :url, presence: true ,format:{with: /\A#{URI::regexp}\z/, message: "That is not a valid URL"}
    validates :uses, presence: true 
    validates :slug, uniqueness:true
    validates :user_id, presence:true

    before_save :set_blank_nil

    def set_blank_nil
        attributes.each do |column,value|
            self[column].present? || self[column] = nil
        end
    end
end
