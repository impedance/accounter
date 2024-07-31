class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :budget

  enum :transaction_types, [:expense :transfer assigning]
end
