class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :title
      t.string :slug
      t.string :url

      t.timestamps
    end
  end
end
