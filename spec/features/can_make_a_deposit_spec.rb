# frozen_string_literal: true

require './lib/bank.rb'

RSpec.describe 'Feature - Makeing a deposit' do
  subject { Bank.new }
  # As a user
  # So that I can put money into my bank account
  # I would like to make a deposit
  Timecop.freeze(Time.local(2019, 9, 13))
  it 'User can make a deposit into their account' do
    subject.deposit(5000)
    expect { subject.bank_statement }.to output("date || credit || debit || balance\n13/09/19 || 5000 ||  || 5000\n").to_stdout
  end
end
