# Bank
A basic repl based bank account

-----
### My process - TODO -

-----
### How to use - TODO -

---
### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

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
### Possible edge cases

- User should not be able to withdraw more than the current balance
