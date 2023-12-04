class DefaultValues < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:links, :uses, 0)    
  end
end

