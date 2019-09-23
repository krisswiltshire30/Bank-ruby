# frozen_string_literal: true

require_relative 'bank_statement'

# Handles deposits to bank account
class Deposit
  def make_a_deposit(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), amount, nil, amount])
    if account.statement.count > 1
      account.statement[0][3] = (account.statement[1][3] + amount)
    end
  end
end
