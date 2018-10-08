class AddVisibleToQuestionsCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :questions_categories, :visible, :boolean
  end
end
