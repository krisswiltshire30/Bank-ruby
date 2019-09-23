# frozen_string_literal: true

require_relative 'bank_statement'

# Handles deposits
class Deposit
  def make_a_deposit(account, amount)
    account.statement.push([Time.now.strftime('%d/%m/%y'), amount, nil, amount])
  end
end
