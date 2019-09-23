# frozen_string_literal: true

require './lib/bank_statement.rb'

RSpec.describe BankStatement do
  subject { BankStatement.new }
  # As a user
  # So that I can put money into my bank account
  # I would like to make a deposit
  describe 'Makeing a deposit' do
    Timecop.freeze(Time.local(2019, 9, 13))
    it 'User can make a deposit into their account' do
      subject.deposit(5000)
      expect { subject.print_statement }.to output("date || credit || debit || balance\n13/09/19 || 5000 ||  || 5000\n").to_stdout
    end
  end
end
