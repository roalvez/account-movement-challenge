require "csv"

class CreateBankAccountService < ServiceBase
  attr_reader :accounts_file

  def initialize(accounts_file)
    @accounts_file = accounts_file
  end

  def call
    file_info = read_file_info

    create_or_update_accounts(file_info)
  end

  private

  def csv_file
    CSV.read(accounts_file, headers: false, skip_blanks: true)
  end

  def read_file_info
    csv_file.map do |account|
      {
        account_number: account.first.to_i,
        initial_balance: account.second.to_i
      }
    end
  end

  def create_or_update_accounts(file_info)
    file_info.each do |account|
      BankAccount.upsert_all(
        [
          account_number: account[:account_number],
          balance: account[:initial_balance]
        ],
        unique_by: :account_number
      )
    end
  end
end
