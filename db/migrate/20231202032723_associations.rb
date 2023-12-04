class Associations < ActiveRecord::Migration[7.1]
  def change
    add_reference :links , :user, index: true
  end
end
