class AddSlugPositionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :slug, :string
    add_column :books, :position, :integer
  end
end
