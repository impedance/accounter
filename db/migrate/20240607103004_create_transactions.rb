class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :budget, null: false, foreign_key: true
      t.decimal :amount
      t.integer :transaction_type, default: 0
      t.date :transaction_date

      t.timestamps
    end
  end
end
