class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :quizz, foreign_key: true
      t.string :rank

      t.timestamps
    end
  end
end
