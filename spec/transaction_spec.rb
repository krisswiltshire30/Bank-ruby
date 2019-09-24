# frozen_string_literal: true

require './lib/bank.rb'
require './lib/bank_account.rb'
require './lib/transaction.rb'

RSpec.describe Transaction do
  subject { Transaction.new }
  let(:bank) { Bank.new }
  let(:bank_account) { BankAccount.new }

  describe 'Withdraw' do
    it 'Adds the date of withdrawal to bank statement' do
      Timecop.freeze(Time.local(2019, 9, 13))
      subject.make_a_deposit(bank_account, 2000)
      subject.make_a_withdrawal(bank_account, 1000)
      expect(bank_account.statement[0][0]).to eq('13/09/19')
    end

    it 'Adds the withdraw amount to bank statement' do
      subject.make_a_deposit(bank_account, 2000)
      subject.make_a_withdrawal(bank_account, 1000)
      expect(bank_account.statement[0][2]).to eq('1000.00')
    end

    it 'Calculates the total balance' do
      subject.make_a_deposit(bank_account, 1000)
      subject.make_a_withdrawal(bank_account, 995)
      expect(bank_account.statement[0][3]).to eq('5.00')
    end

    it 'Should raise error if withdraw amount is more than balance' do
      subject.make_a_deposit(bank_account, 1)
      expect { subject.make_a_withdrawal(bank_account, 5) }.to raise_error('Not enough funds')
    end
  end

  describe 'Deposit' do
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
end
