# frozen_string_literal: false

require './lib/account.rb'

RSpec.describe 'Feature - Makeing a deposit' do
  subject { Account.new }
  # As a user
  # So that I can put money into my bank account
  # I would like to make a deposit
  Timecop.freeze(Time.local(2019, 9, 13))
  it 'User can make a deposit into their account' do
    subject.deposit(5000)
    expected_output = "date || credit || debit || balance\n"
    expected_output << "13/09/19 || 5000.00 ||  || 5000.00\n"
    expect { subject.bank_statement }.to output("date || credit || debit || balance\n13/09/19 || 5000.00 ||  || 5000.00\n").to_stdout
  end
end
