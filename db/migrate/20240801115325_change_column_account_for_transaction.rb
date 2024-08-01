class ChangeColumnAccountForTransaction < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :account_id, true
    add_column :transactions, :description, :string
  end

  # def down
  #   change_column_null :transactions, :account_id, false
  #   remove_column :transactions, :description, :string
  # end
end
