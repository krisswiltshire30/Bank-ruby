# :bank: Bank :bank:

A basic repl based bank account

### | [Process](#Process) | [How to use](#How-to-use) | [User stories](#User-stories) | [Acceptance criteria](#Acceptance-criteria) | [Domain Model](#Domain-model) |

---

#### Tech used

- Ruby
- Rspec - Test framework
- Rubocop - Linter
- SimpleCov - Test coverage
- TimeCop - Stubbing time

---

### Process

- I decided to split the acceptance criteria into smaller users stories and tackle from there.
- I then wrote some sudo code in IRB and settled on an array of arrays to handle that data.
- I made this decision based on how easily iterating over an array of arrays fulfills the required look of the statement.
- The statement is handled by the bank account class by itterating over the arrays in reverse chronological order, it then puts out the array and joins with the table dividers '||'
- The deposit and withdrawal class takes the account and amount as arguments and adds this information, as well as the date, as another array within the statement class
- Both withdrawal and deposit class update the balance whenever a new array is added
- Finally, all classes are controlled from within the bank class.
- See the [Domain Model](#Domain-model) for more info

---

### How to use

1. Clone the repo

```bash
$ git clone https://github.com/krisswiltshire30/Bank-ruby
```

2. Install gems

```bash
$ bundle install
```

3. Run tests

```bash
$ rspec
```

_IRB Example_

```ruby
> require './lib/account.rb'
> bank = Account.new
> bank.deposit(500)
> bank.bank_statement
> =>
> date || credit || debit || balance
> 23/09/19 || 500.00 ||  || 500.00
>
> bank.deposit(600)
> bank.bank_statement
> =>
> date || credit || debit || balance
> 23/09/19 || 600.00 ||  || 1100.00
> 23/09/19 || 500.00 ||  || 500.00
>
> bank.withdraw(400)
> bank.bank_statement
> =>
> date || credit || debit || balance
> 23/09/19 ||  || 400.00 || 700.00
> 23/09/19 || 600.00 ||  || 1100.00
> 23/09/19 || 500.00 ||  || 500.00
```

---

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

---

### User stories

_**Statement attributes**_

```
As a user
So that I see my bank history
I would like to view my bank statement
```

```
As a user
So that I see how much I have deposited and withdrawn
I would like all amounts to be logged in my bank statement
```

```
As a user
So that I know what date withdrawals were made
I would like the date of all withdrawals to be logged in my bank statement
```

```
As a user
So that I know what date deposits were made
I would like the date of all deposits to be logged in my bank statement
```

_**Action attributes**_

```
As a user
So that I can put money into my bank account
I would like to make a deposit
```

```
As a user
So that I can deposit and withdraw the correct amount
I would like to input the requred amount
```

```
As a user
So that I can spend my money
I would like to withdraw money from my bank account
```

```
As a user
So that I can see my most recent activity
I would like to see my transactions in reverse chronological order
```

---

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```bash
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

---

### Domain Model

| Classes           | Methods           | Behaviour                                                                                                                                                                                                                                                                        |
| ----------------- | ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| _Statement_   | print_statement   | puts out all transactions                                                                                                                                                                                                                                                        |
| _Transaction_ | make_a_deposit    | - Takes the account and amount as arguments and adds this information, as well as the date, as another array within the statement class. - Adds amount to the balance whenever a new array is added                                                                              |
|                   | make_a_withdrawal | - Takes the account and amount as arguments and adds this information, as well as the date, as another array within the statement class. - Subtracts the amount from the last balance whenever a new array is added. - _Edge Case_ - Should raise an error if insufficient funds |
| _Account_     |                   | Controller for all classes                                                                                                                                                                                                                                                       |
|                   | deposit           | Calls make_a_deposit                                                                                                                                                                                                                                                             |
|                   | withdraw          | Calls make_a_withdrawal                                                                                                                                                                                                                                                          |
|                   | bank_statement    | Calls print_statement                                                                                                                                                                                                                                                            |

### Edge cases

- User should not be able to withdraw more than the current balance
