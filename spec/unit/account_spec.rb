# frozen_string_literal: true

require './lib/account.rb'

RSpec.describe BankAccount do
  describe 'Deposit' do
    it 'Should return a string containing how much has been deposited' do
      expect(subject.deposit(50)).to eq('£50 deposited into your to account')
    end
  end

  describe 'Withdraw' do
    it 'Should return a string containing how much has been deposited' do
      subject.deposit(50)
      expect(subject.withdraw(20)).to eq('£20 withdrawn from your account')
    end
  end

  describe 'Bank Statement' do
    it 'Should return a bank statment' do
      Timecop.freeze(Time.local(2019, 9, 13))
      subject.deposit(50)
      expect { subject.bank_statement }
        .to output("date || credit || debit || balance\n13/09/19 || 50.00 ||  || 50.00\n").to_stdout
      expect(subject.bank_statement).to include('Statement printed')
    end
  end
end
