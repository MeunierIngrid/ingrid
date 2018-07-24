class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :description, :text
    add_monetize :books, :price, currency: { present: false }
  end
end
