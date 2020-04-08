require 'rails_helper'

RSpec.describe BankBalanceService do
  let(:spec_accounts_csv) { 'spec/fixtures/documents/spec_accounts.csv' }

  let(:spec_transactions_csv) do
    'spec/fixtures/documents/spec_transactions.csv'
  end

  let(:create_account_service_class) { CreateBankAccountService }
  let(:update_account_service_class) { UpdateBankAccountService }
  let(:show_account_service_class) { ShowBankAccountService }

  before do
    allow(show_account_service_class).to receive(:call).and_return(nil)
  end

  after do
    described_class.call(spec_accounts_csv, spec_transactions_csv)
  end

  describe '.call' do
    it 'calls create bank account service' do
      expect(create_account_service_class).to receive(:call).
        once.with(spec_accounts_csv)
    end

    it 'calls update bank account service' do
      expect(update_account_service_class).to receive(:call).
        once.with(spec_transactions_csv)
    end

    it 'calls show bank account service' do
      expect(show_account_service_class).to receive(:call).once
    end
  end
end
