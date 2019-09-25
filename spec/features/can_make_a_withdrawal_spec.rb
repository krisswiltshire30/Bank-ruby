# frozen_string_literal: false

require './lib/account.rb'

RSpec.describe 'Feature - Makeing a withdrawal' do
  subject { Account.new }
  # As a user
  # So that I can spend my money
  # I would like to withdraw money from my bank account
  Timecop.freeze(Time.local(2019, 9, 13))
  it 'Users can withdraw money out their account' do
    subject.deposit(5000)
    subject.withdraw(1000)
    expected_output = "date || credit || debit || balance\n"
    expected_output << "13/09/19 ||  || 1000.00 || 4000.00\n"
    expected_output << "13/09/19 || 5000.00 ||  || 5000.00\n"
    expect { subject.bank_statement }.to output(expected_output).to_stdout
  end
end
