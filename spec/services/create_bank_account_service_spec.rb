require 'rails_helper'

RSpec.describe CreateBankAccountService do
  describe '.call' do
    context 'when there are accounts inside the csv file' do
      let(:spec_accounts_csv) do
        'spec/fixtures/documents/spec_accounts.csv'
      end

      let(:service_call) { described_class.call(spec_accounts_csv) }

      it 'creates bank accounts' do
        expect { service_call }.to change { BankAccount.count }.by(1)
      end
    end

    context 'when csv file is empty' do
      let(:spec_empty_accounts_csv) do
        'spec/fixtures/documents/spec_empty.csv'
      end

      let(:empty_service_call) do
        described_class.call(spec_empty_accounts_csv)
      end

      it 'does not create any bank account' do
        expect { empty_service_call }.to_not change(BankAccount, :count)
      end
    end

    context 'when there are accounts with the same number inside the file' do
      let(:spec_duplicate_accounts_csv) do
        'spec/fixtures/documents/spec_duplicate_accounts.csv'
      end

      let(:duplicate_service_call) do
        described_class.call(spec_duplicate_accounts_csv)
      end

      it 'creates one bank account' do
        expect { duplicate_service_call }.to change { BankAccount.count }.by(1)
      end
    end
  end
end
