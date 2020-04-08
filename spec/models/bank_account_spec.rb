require 'rails_helper'

RSpec.describe BankAccount do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:account_number) }
    it { is_expected.to validate_presence_of(:balance) }

    describe 'account_number uniqueness' do
      subject { create(:bank_account) }

      it { is_expected.to validate_uniqueness_of(:account_number) }
    end
  end

  describe 'callbacks' do
    describe '.negative_balance_penalty' do
      let(:bank_account) { create(:bank_account, balance: 1000) }

      before do
        bank_account.update(balance: -1700)
      end

      it "adds penalty price to balance" do
        expect(bank_account.balance).to eq(-2000)
      end
    end
  end
end
