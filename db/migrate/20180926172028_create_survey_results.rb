class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.string :title
      t.integer :min_value
      t.integer :max_value
      t.text :content

      t.timestamps
    end
  end
end
