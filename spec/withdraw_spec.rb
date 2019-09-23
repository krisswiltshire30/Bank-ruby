# frozen_string_literal: true

require './lib/bank.rb'
require './lib/bank_account.rb'
require './lib/withdraw.rb'
require './lib/deposit.rb'

RSpec.describe Withdraw do
  subject { Withdraw.new }
  let(:bank) { Bank.new }
  let(:deposit) { Deposit.new }
  let(:bank_account) { BankAccount.new }

  it 'Adds the date of withdrawal to bank statement' do
    Timecop.freeze(Time.local(2019, 9, 13))
    deposit.make_a_deposit(bank_account, 2000)
    subject.make_a_withdrawal(bank_account, 1000)
    expect(bank_account.statement[0][0]).to eq('13/09/19')
  end

  it 'Adds the withdraw amount to bank statement' do
    deposit.make_a_deposit(bank_account, 2000)
    subject.make_a_withdrawal(bank_account, 1000)
    expect(bank_account.statement[0][2]).to eq(1000)
  end

  it 'Calculates the total balance' do
    deposit.make_a_deposit(bank_account, 1000)
    subject.make_a_withdrawal(bank_account, 1000)
    expect(bank_account.statement[0][3]).to eq(0)
  end

end
