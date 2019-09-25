# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# Bank controller
class Account
  def initialize(statement = Statement, transaction = Transaction)
    @statement = statement.new
    @transaction = transaction.new
  end

  def deposit(amount)
    @transaction.make_a_deposit(@statement, amount)
    "£#{amount} deposited into your to account"
  end

  def withdraw(amount)
    @transaction.make_a_withdrawal(@statement, amount)
    "£#{amount} withdrawn from your account"
  end

  def bank_statement
    @statement.print_statement
  end
end
