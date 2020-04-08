class BankBalanceService < ServiceBase
  attr_reader :accounts_file, :transactions_file

  def initialize(accounts_file, transactions_file)
    @accounts_file = accounts_file
    @transactions_file = transactions_file
  end

  def call
    CreateBankAccountService.call(accounts_file)
    UpdateBankAccountService.call(transactions_file)
    ShowBankAccountService.call
  end
end
