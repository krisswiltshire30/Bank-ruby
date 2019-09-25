# frozen_string_literal: false

require './lib/account.rb'

RSpec.describe 'Feature - Viewing bank statement' do
  subject { Account.new }
  # As a user
  # So that I see my bank history
  # I would like to view my bank statement
  it 'Users should be able to view their bank statement' do
    expect { subject.bank_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'Users should be able to see their calculated balance' do
    subject.deposit(500)
    subject.deposit(500)
    expected_output = "date || credit || debit || balance\n"
    expected_output << "13/09/19 || 500.00 ||  || 1000.00\n"
    expected_output << "13/09/19 || 500.00 ||  || 500.00\n"
    expect { subject.bank_statement }.to output(expected_output).to_stdout
  end
end
