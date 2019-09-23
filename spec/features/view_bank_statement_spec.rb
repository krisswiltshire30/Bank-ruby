# frozen_string_literal: true

require './lib/bank_account.rb'
require './lib/bank.rb'

RSpec.describe Bank do
  subject { Bank.new }
  # As a user
  # So that I see my bank history
  # I would like to view my bank statement
  describe 'Viewing statement' do
    it 'User should be able to view their bank statement' do
      expect { subject.bank_statement }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'Users should be able to see their calculated balance' do
      subject.deposit(500)
      subject.deposit(500)
      expect { subject.bank_statement }.to output("date || credit || debit || balance\n13/09/19 || 500 ||  || 1000\n13/09/19 || 500 ||  || 500\n").to_stdout
    end
  end
end
