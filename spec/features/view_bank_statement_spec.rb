# frozen_string_literal: true

require './lib/bank_statement.rb'

RSpec.describe BankStatement do
  subject { BankStatement.new }
  # As a user
  # So that I see my bank history
  # I would like to view my bank statement
  describe 'Viewing statement' do
    it 'User should be able to view their bank statement' do
      expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
