class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :questions_category, foreign_key: true
      t.string :coefficient

      t.timestamps
    end
  end
end
