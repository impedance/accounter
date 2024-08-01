class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :budget

  enum :transaction_type, { expense: 0, allocation: 1, income: 2, transfer: 3 }
end
