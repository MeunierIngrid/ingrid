class AddBackupToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :backup, :jsonb
  end
end
