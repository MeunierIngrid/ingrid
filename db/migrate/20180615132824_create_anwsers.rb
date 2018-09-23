class CreateAnwsers < ActiveRecord::Migration[5.2]
  def change
    create_table :anwsers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
