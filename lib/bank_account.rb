# frozen_string_literal: true

# Logs requests to deposit and withdraw classes into an array
class BankAccount
  attr_accessor :statement

  def initialize(statement = [])
    @statement = statement
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @statement.each do |line|
      puts line.join(' || ')
    end
  end

  def balance_total(account)
    if account.statement[0][1].nil?
      account.statement[0][3] = format('%.2f', (account.statement[1][3].to_i - amount))
    else
      account.statement[0][3] = format('%.2f', (account.statement[1][3].to_i + amount))
  end
end
end
