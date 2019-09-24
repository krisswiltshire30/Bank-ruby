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
  end

  def withdraw(amount)
    @transaction.make_a_withdrawal(@bank_account, amount)
  end

  def bank_statement
    @bank_account.print_statement
  end
end
