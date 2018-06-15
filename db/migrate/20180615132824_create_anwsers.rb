class CreateAnwsers < ActiveRecord::Migration[5.2]
  def change
    create_table :anwsers do |t|
      t.references :user, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
    end
  end
end
