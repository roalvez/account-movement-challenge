class BankAccount < ApplicationRecord
  validates :account_number, :balance, presence: true
  validates :account_number, uniqueness: true

  before_update :negative_balance_penalty

  private

  def negative_balance_penalty
    return if balance >= 0

    self.balance -= 300
  end
end
