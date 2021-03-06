class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :email
      t.references :book, foreign_key: true
      t.monetize :amount, currency: { present: false }
      t.jsonb :payment


      t.timestamps
    end
  end
end
