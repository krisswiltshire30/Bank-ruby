# frozen_string_literal: true

require './lib/bank.rb'
require './lib/bank_account.rb'
require './lib/deposit.rb'

RSpec.describe Deposit do
  subject { Deposit.new }
  let(:bank) { Bank.new }
  let(:bank_account) { BankAccount.new }

  it 'Adds the date of deposit to bank statement' do
    Timecop.freeze(Time.local(2019, 9, 13))
    subject.make_a_deposit(bank_account, 1000)
    expect(bank_account.statement[0][0]).to eq('13/09/19')
  end

  it 'Adds the deposit amount bank statement' do
    subject.make_a_deposit(bank_account, 1000)
    expect(bank_account.statement[0][1]).to eq('1000.00')
  end

  it 'Calculates the total balance' do
    subject.make_a_deposit(bank_account, 1000)
    subject.make_a_deposit(bank_account, 1000)
    expect(bank_account.statement[0][3]).to eq('2000.00')
  end

end
