class CreateQuestionsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_categories do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
