class AddVisibleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :visible, :boolean
  end
end
