# frozen_string_literal: true

require_relative 'bank_statement'
require_relative 'deposit'
require_relative 'withdraw'

# Bank controller
class Bank
  def initialize
    @bank_statement = BankStatement.new
    @deposit = Deposit.new
    @withdraw = Withdraw.new
  end

  def deposit(amount)
    @deposit.make_a_deposit(@bank_statement, amount)
  end

  def withdraw(amount)
    @withdraw.make_a_withdrawal(@bank_statement, amount)
  end

  def bank_statement
    @bank_statement.print_statement
  end
end
