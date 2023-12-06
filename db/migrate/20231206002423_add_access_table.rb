class AddAccessTable < ActiveRecord::Migration[7.1]
  def change
    create_table :accesses do |t|
      t.belongs_to :link
      t.string :ip
      t.datetime :date_and_time
    end
  end
end
