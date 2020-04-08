class ShowBankAccountService < ServiceBase
  DISPLAY_SPACE = 75

  def call
    display_header
    display_accounts
  end

  private

  def display_header
    puts
    p '-'.ljust(DISPLAY_SPACE, '-')
    p 'REGISTERED BANK ACCOUNTS'.center(DISPLAY_SPACE)
    p '-'.ljust(DISPLAY_SPACE, '-')
  end

  def display_accounts
    bank_accounts = BankAccount.all

    return no_accounts_message unless bank_accounts.any?

    display_each_account(bank_accounts)
  end

  def bank_accounts
    @bank_accounts ||= BankAccount.all
  end

  def no_accounts_message
    p 'NO REGISTERED ACCOUNT'.center(DISPLAY_SPACE, ' ')
  end

  def display_each_account(accounts)
    accounts.each do |account|
      p "ID: #{account.id}".center(DISPLAY_SPACE, ' ')
      p "Account Number: #{account.account_number}".center(DISPLAY_SPACE, ' ')
      p "Balance: #{account.balance}".center(DISPLAY_SPACE, ' ')
      p "Challenge Output: #{account.account_number},#{account.balance}".
        center(DISPLAY_SPACE, ' ')
      puts
    end
  end
end
