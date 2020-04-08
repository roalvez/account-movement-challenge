class BankBalanceService < ServiceBase
  attr_reader :accounts_file, :transactions_file, :old_logger

  def initialize(accounts_file, transactions_file)
    @accounts_file = accounts_file
    @transactions_file = transactions_file
    @old_logger = ActiveRecord::Base.logger
  end

  def call
    remove_logger

    CreateBankAccountService.call(accounts_file)
    UpdateBankAccountService.call(transactions_file)
    ShowBankAccountService.call

    apply_logger
  end

  private

  def remove_logger
    ActiveRecord::Base.logger = nil
  end

  def apply_logger
    ActiveRecord::Base.logger = old_logger

    nil
  end
end
