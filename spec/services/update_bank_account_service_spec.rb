require 'rails_helper'

RSpec.describe UpdateBankAccountService do
  describe '.call' do
    let!(:bank_account) do
      create(
        :bank_account,
        account_number: 100,
        balance: 100
      )
    end

    context 'when there are transactions inside the csv file' do
      let(:spec_transactions_csv) do
        'spec/fixtures/documents/spec_transactions.csv'
      end

      before do
        described_class.call(spec_transactions_csv)
      end

      it 'updates bank accounts' do
        bank_account.reload

        expect(bank_account.balance).to eq(600)
      end
    end

    context 'when csv file is empty' do
      let(:spec_empty_csv) do
        'spec/fixtures/documents/spec_empty.csv'
      end

      before do
        described_class.call(spec_empty_csv)
      end

      it 'does not update any bank account' do
        bank_account.reload

        expect(bank_account.balance).to eq(bank_account.balance)
      end
    end
  end
end
