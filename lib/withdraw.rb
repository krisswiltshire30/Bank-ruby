# frozen_string_literal: true

require_relative 'bank_statement'

# Handles withdrawels from bank account
class Withdraw
  def make_a_withdrawal(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), nil, amount, amount])
    account.statement[0][3] = (account.statement[1][3] - amount)
  end
end
