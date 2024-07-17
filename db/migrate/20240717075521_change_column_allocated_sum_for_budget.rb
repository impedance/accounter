class ChangeColumnAllocatedSumForBudget < ActiveRecord::Migration[7.0]
  def up
    change_column :budgets, :allocated_sum, :decimal, precision: 5, scale: 2
    change_column_default :budgets, :allocated_sum, default: 0
  end

  def down
    change_column :budgets, :allocated_sum, :decimal
    change_column_default :budgets, :allocated_sum, default: nil
  end
end
