# frozen_string_literal: true

require './lib/statement.rb'
RSpec.describe Statement do
  describe 'Print statement' do
    it 'Should print a bank statement' do
      expect(subject.print_statement).to include('Statement printed')
    end
  end
end
