# Bank tech test

This is a small project to practice maintaining high code quality, and using a good TDD process.

## Quick Start Guide

1. Clone this repository to your local machine.
2. Enter its root folder.
3. Launch IRB:
```
irb
```
Once in IRB:
```
> require './lib/account.rb'
> account = Account.new
```
5. Use the following methods with your account:

Methods         | Description
----------------|------------
deposit(amount) |  This method allows you to deposit money into the account. Use a number with up to two decimal places as the parameter.
withdraw(amount) | This method allows you to withdraw money from the account. Use a number with up to two decimal places as the parameter.
print_statement | This method will print your account statement to the console.

## Specification

### Requirements

- Runs from IRB.
- Can accept deposits and withdrawals.
- Account statement with date, amount and balance printing.
- Data can be kept in memory (not a database).
  
### Acceptance Criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

# Development Journal 
## Planning

### Domain model

Objects | Messages 
--------|--------
Account | deposit(amount, date) <br> withdraw(amount, date) <br> print_statement

### Tests

From the users perspective in irb:
```
> account = Account.new
> account.deposit(1000, "10/01/2012")
> account.print
date || credit || debit || balance
10/01/2012 || 1000.00 || || 1000.00
```
For multiple deposits:
```
> account = Account.new
> account.deposit(1000, "10/01/2012")
> account.deposit(1000, "13/01/2012")
> account.print
date || credit || debit || balance
13/01/2012 || 1000.00 || || 2000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

- [x] 1

> As a user,  
> So that I can acces banking serviecs,  
> I would like to be able to make an account.

- [x] 2

> As a user,  
> So that I can add money to my account,  
> I would like to be able to add deposits.

- [x] 3

> As a user,  
> So that I can assess my money,  
> I would like to be able to withdraw money from my account.

- [x] 4

> As a user,  
> So that I can see my account history,  
> I would like to be able to print my statement out.

- [x] 5

> As a user,  
> So I can make exact transactions,  
> I would like my program to be able to calculate with pennies

- [ ] 6

> As a banker,  
> So that the system is reliable,  
> I would like it to reject false values such as strings and numbers with more than two decimal places.

- [ ] 7

> As a banker,  
> So that I don't lose money,  
> I want users to have a credit limit.

- [ ] 8

> As a developer,  
> So the code is easily readable,
> I would like it to be linted.

- [ ] 9

> As a developer,  
> So that I know all the code is working,  
> I would like to be able to see test coverage.

## Set up

I started this project by creating an empty repository on my local machine and github. Then in the local repository, I did the following.
```
touch README.md
git init
rspec --init
mkdir lib
```

## Making an account

- [x] 1

> As a user,  
> So that I can acces banking serviecs,  
> I would like to be able to make an account.

First I wrote a simple describe block that requires the existence of an Account class in ```spec/account_spec.rb```. Red.

Then I created ```lib/account.rb``` and added:
```ruby
class Account
end
```
Green.

## Depositing and printing the statement

- [x] 2

> As a user,  
> So that I can add money to my account,  
> I would like to be able to add deposits.

- [x] 4

> As a user,  
> So that I can see my account history,  
> I would like to be able to print my statement out.

I wrote a test for both of these user stories in one go, as a feature test, that first made a single deposit to the account and then printed the statement. Red.

- Created ```deposit``` and ```print_statement``` methods and hardcoded the result. 

Green.

Wrote a test for 2 deposits, then ```print_statement```. Red.

- Hardcoded result using if and else statements.

Green.

Test for 3 deposits, then print_statment. Red.

- Hardcoded result using if and else statements.

Green.

Test for 4 deposits, then print_statment. Red.

- Hardcoded result using if and else statements.

Green.

Then, seeing clearly the pattern appearing, I refactored the ```print_statement``` method into a loop that would deal any number or type of deposits.

## Withdrawing and printing the statement

- [x] 3

> As a user,  
> So that I can assess my money,  
> I would like to be able to withdraw money from my account.

- [x] 4

> As a user,  
> So that I can see my account history,  
> I would like to be able to print my statement out.


I then feature tested the withdrawl aspect of the program.

I wrote a test that withdrew money using the ```withdraw``` method. Red

- Created a ```withdraw``` method and adjusted the ```print_statment``` method accordingly.

Green.

Then I refactored the code to make it more easily readable and simple.

## Working with pennies

- [x] 5

> As a user,  
> So I can make exact transactions,  
> I would like my program to be able to calculate with pennies

I wrote a feature test where the use withdraws pennies. Red

 - Updated the ```print_statement``` method to use the following code which ensures all numbers are dealt with in 2 decimal points:

```ruby
'%.2f' % number
```
Green.

## Realising I made a mistake

Currently my program assumes the user will enter the date, I believe this was a mistake, and now I need to refactor my code and tests to take account for this, so that the date is added automatically.

I began by refactoring my tests. I now had to mock the dates in the test as such:
```ruby
    time1 = Time.new(2012, 1, 10, 12)
    time2 = Time.new(2012, 1, 13, 12)

    allow(Time).to receive(:now).and_return(time1)
    subject.deposit(1000)

    allow(Time).to receive(:now).and_return(time2)
    subject.deposit(1000)
```

First I refactored just my first test. Red.

- Then in the ```deposit``` method I used some code that records the current date.
```ruby
date = Time.now
date_refactored = date.strftime('%d/%m/%Y')
```
Green.

Then I refactored all the other tests. Red

- I had to update the ```withdraw``` method to also use the new date system.

Green.




