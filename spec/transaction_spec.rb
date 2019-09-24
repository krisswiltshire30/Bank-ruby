# frozen_string_literal: true

require './lib/statement.rb'
require './lib/transaction.rb'

RSpec.describe BankTransaction do
  subject { BankTransaction.new }
  let(:statement) { BankStatement.new }

  describe 'Withdraw' do
    it 'Adds the date of withdrawal to bank statement' do
      Timecop.freeze(Time.local(2019, 9, 13))
      subject.make_a_deposit(statement, 2000)
      subject.make_a_withdrawal(statement, 1000)
      expect(statement.statement[0][0]).to eq('13/09/19')
    end

    it 'Adds the withdraw amount to bank statement' do
      subject.make_a_deposit(statement, 2000)
      subject.make_a_withdrawal(statement, 1000)
      expect(statement.statement[0][2]).to eq('1000.00')
    end

    it 'Calculates the total balance' do
      subject.make_a_deposit(statement, 1000)
      subject.make_a_withdrawal(statement, 995)
      expect(statement.statement[0][3]).to eq('5.00')
    end

    it 'Should raise error if trying to withdraw before depositing' do
      expect { subject.make_a_withdrawal(statement, 5) }.to raise_error('Not enough funds')
    end

    it 'Should raise error if trying to withdraw more than current balance' do
      subject.make_a_deposit(statement, 1)
      expect { subject.make_a_withdrawal(statement, 5) }.to raise_error('Not enough funds')
    end
  end
end

RSpec.describe BankTransaction do
  subject { BankTransaction.new }
  let(:statement) { BankStatement.new }

  describe 'Deposit' do
    it 'Adds the date of deposit to bank statement' do
      Timecop.freeze(Time.local(2019, 9, 13))
      subject.make_a_deposit(statement, 1000)
      expect(statement.statement[0][0]).to eq('13/09/19')
    end

    it 'Adds the deposit amount bank statement' do
      subject.make_a_deposit(statement, 1000)
      expect(statement.statement[0][1]).to eq('1000.00')
    end

    it 'Calculates the total balance' do
      subject.make_a_deposit(statement, 1000)
      subject.make_a_deposit(statement, 1000)
      expect(statement.statement[0][3]).to eq('2000.00')
    end
  end
end
