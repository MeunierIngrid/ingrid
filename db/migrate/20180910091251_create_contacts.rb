class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.boolean :hp
      t.integer :rdv
      t.string :rdv_other
      t.text :informations
      t.text :other
      t.text :complement

      t.timestamps
    end
  end
end
