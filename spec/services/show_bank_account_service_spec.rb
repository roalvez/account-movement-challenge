require 'rails_helper'

RSpec.describe ShowBankAccountService do
  subject(:show_bank_account_service) { described_class.new }

  describe '.call' do
    before do
      allow(show_bank_account_service).to receive(:display_header).
        and_return(nil)

      allow(show_bank_account_service).to receive(:no_accounts_message).
        and_return(nil)

      allow(show_bank_account_service).to receive(:display_each_account).
        and_return(nil)
    end

    after do
      show_bank_account_service.call
    end

    it 'display headers' do
      expect(show_bank_account_service).to receive(:display_header).once
    end

    context 'when there are no bank accounts' do
      it 'displays no accounts message' do
        expect(show_bank_account_service).to receive(:no_accounts_message).once
      end
    end

    context 'when there are accounts' do
      before do
        create(:bank_account)
      end

      it 'displays each account message' do
        expect(show_bank_account_service).to receive(:display_each_account).once
      end
    end
  end
end
