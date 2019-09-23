# frozen_string_literal: true

class BankStatement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def print_statement
    @statement.unshift(%w[date credit debit balance]) if @statement == []
    @statement.each do |line|
      puts line.join(' || ')
    end
  end
end

# statement = BankStatement.new
# statement.print_statement
