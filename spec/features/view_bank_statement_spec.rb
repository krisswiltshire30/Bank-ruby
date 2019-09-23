# frozen_string_literal: true
require './lib/bank_statement.rb'
# As a user
# So that I see my bank history
# I would like to view my bank statement

describe 'View bank statement' do
  it 'User should be able to view bank statement' do
    statement = BankStatement.new
    expect(statement.print_statement).to include('date || credit || debit || balance')
  end
end
