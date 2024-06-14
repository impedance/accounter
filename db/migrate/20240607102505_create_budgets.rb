class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :allocated_sum

      t.timestamps
    end
  end
end
