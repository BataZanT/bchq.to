class AddAttributes < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :password_digest, :string
    add_column :links, :expiration_date, :date
  end
end
