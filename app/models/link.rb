class Link < ApplicationRecord
    belongs_to :user 
    validates :title, presence: true, uniqueness: {scope: :user_id, message: "You alredy have a link with that title"}
    validates :url, presence: true ,format:{with: /\A#{URI::regexp}\z/, message: "That is not a valid URL"}
    validates :uses, presence: true 
    validates :slug, uniqueness:true
    validates :user_id, presence:true
end
