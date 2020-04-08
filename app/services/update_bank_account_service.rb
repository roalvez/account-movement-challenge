class UpdateBankAccountService < ServiceBase
  attr_reader :transactions_file

  def initialize(transactions_file)
    @transactions_file = transactions_file
  end

  def call
    file_info = read_file_info

    update_bank_accounts(file_info)
  end

  private

  def csv_file
    CSV.read(transactions_file, headers: false, skip_blanks: true)
  end

  def read_file_info
    csv_file.map do |account|
      {
        account_number: account.first.to_i,
        movement: account.second.to_i
      }
    end
  end

  def update_bank_accounts(file_info)
    file_info.each do |account|
      bank_account = bank_account_object(account[:account_number])

      next if bank_account.nil?

      bank_account.balance += account[:movement]

      bank_account.update(balance: bank_account.balance)
    end
  end

  def bank_account_object(account_number)
    BankAccount.find_by(account_number: account_number)
  end
end
