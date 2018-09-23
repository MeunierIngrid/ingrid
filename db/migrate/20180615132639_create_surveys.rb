class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
