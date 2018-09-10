class AddAbstractToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :abstract, :text
  end
end
