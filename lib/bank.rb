# frozen_string_literal: true

require_relative 'bank_statement'
require_relative 'deposit'

# Bank controller
class Bank
  def initialize
    @bank_statement = BankStatement.new
    @deposit = Deposit.new
  end

  def deposit(amount)
    @deposit.make_a_deposit(@bank_statement, amount)
  end

  def bank_statement
    @bank_statement.print_statement
  end
end

# Bank.new.bank_statement
