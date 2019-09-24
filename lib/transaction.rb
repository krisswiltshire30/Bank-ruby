# frozen_string_literal: true

require_relative 'bank_account'

# Handles deposits and withdrawels from bank account
class Transaction
  def make_a_withdrawal(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), nil,
                               format('%.2f', amount), format('%.2f', amount)])
    balance_totaller(account, amount)
  end

  def make_a_deposit(account, amount)
    account.statement.unshift([Time.now.strftime('%d/%m/%y'), format('%.2f', amount),
                               nil, format('%.2f', amount)])
    balance_totaller(account, amount)
  end

  def balance_totaller(account, amount)
    return unless account.statement.count > 1

    account.statement[0][3] = if account.statement[0][2].nil?
                                format('%.2f', (account.statement[1][3].to_i + amount))
                              else
                                format('%.2f', (account.statement[1][3].to_i - amount))
                              end
  end
end
