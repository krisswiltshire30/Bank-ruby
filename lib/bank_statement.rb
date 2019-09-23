# frozen_string_literal: true

# Logs requests to deposit and withdraw classes into an array
class BankStatement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @statement.each do |line|
      puts line.join(' || ')
    end
  end
end
