# frozen_string_literal: true

require './lib/bank.rb'

RSpec.describe 'Feature - Makeing a withdrawal' do
  subject { Bank.new }
  # As a user
  # So that I can spend my money
  # I would like to withdraw money from my bank account
  Timecop.freeze(Time.local(2019, 9, 13))
  it 'Users can withdraw money out their account' do
    subject.deposit(5000)
    subject.withdraw(1000)
    expect { subject.bank_statement }
      .to output("date || credit || debit || balance\n13/09/19 ||  || 1000.00 || 4000.00\n13/09/19 || 5000.00 ||  || 5000.00\n").to_stdout
  end
end
