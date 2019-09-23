# frozen_string_literal: true

class BankStatement
  attr_accessor :statement

  def initialize
    @statement = 'date || credit || debit || balance'
  end

  def print_statement()
    @statement
  end
end
