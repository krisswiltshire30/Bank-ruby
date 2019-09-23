# frozen_string_literal: true

class BankStatement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def deposit(amount)
    @statement.push([Time.now.strftime("%d/%m/%y"),amount, nil,amount])
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @statement.each do |line|
      puts line.join(' || ')
    end
  end
end

# statement = BankStatement.new
# statement.deposit(5000)
# statement.print_statement
