require 'faker'

FactoryBot.define do
  factory :bank_account do
    account_number { Faker::Number.number(digits: 3) }
    balance { Faker::Number.number(digits: 6) }
  end
end
