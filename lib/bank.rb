# frozen_string_literal: true

require_relative 'bank_account'
require_relative 'deposit'
require_relative 'withdraw'

# Bank controller
class Bank
  def initialize
    @bank_account = BankAccount.new
    @deposit = Deposit.new
    @withdraw = Withdraw.new
  end

  def deposit(amount)
    @deposit.make_a_deposit(@bank_account, amount)
  end

  def withdraw(amount)
    @withdraw.make_a_withdrawal(@bank_account, amount)
  end

  def bank_statement
    @bank_account.print_statement
  end
end
