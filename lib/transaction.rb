# frozen_string_literal: true

require_relative 'bank_account'

# Handles withdrawels from bank account
class Transaction
  def make_a_withdrawal(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), nil, '%.2f' % amount, '%.2f' % amount])
    account.statement[0][3] = format('%.2f', (account.statement[1][3].to_i - amount))
  end

  def make_a_deposit(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), '%.2f' % amount, nil, '%.2f' % amount])
    if account.statement.count > 1
      account.statement[0][3] = format('%.2f', (account.statement[1][3].to_i + amount))
    end
  end
end
