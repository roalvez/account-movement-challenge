class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.integer :account_number, null: false
      t.integer :balance, null: false

      t.index :account_number, unique: true
    end
  end
end
