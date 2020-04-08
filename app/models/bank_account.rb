class BankAccount < ApplicationRecord
  validates :account_number, :balance, presence: true
  validates :account_number, uniqueness: true

  before_update :negative_balance_tax

  private

  def negative_balance_penalty
    return if self.balance >= 0

    self.balance -= 3
  end
end
