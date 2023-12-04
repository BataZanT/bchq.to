class DeleteShortUrl < ActiveRecord::Migration[7.1]
    def change
      remove_column :links, :short_url, :string
    end
end
