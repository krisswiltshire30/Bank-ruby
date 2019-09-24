# frozen_string_literal: true

require_relative 'bank_account'
require_relative 'transaction'

# Bank controller
class Bank
  def initialize
    @bank_account = BankAccount.new
    @transaction = Transaction.new
  end

  def deposit(amount)
    @transaction.make_a_deposit(@bank_account, amount)
    "£#{amount} deposited into your to account"
  end

  def withdraw(amount)
    @transaction.make_a_withdrawal(@bank_account, amount)
    "£#{amount} withdrawn from your account"
  end

  def bank_statement
    @bank_account.print_statement
    'Statement printed'
  end
end
