# Bank tech test

This is a small REPL based banking application made in my 10th week at Makers Academy.

This project is intended to demonstrate I can code at a professional level of quality.

## Notes

 - Ruby version 2.7.0
 - 100% Test coverage
 - Fully rubocop linted
 - Followed strict TDD
## Quick Start Guide

1. Clone this repository to your local machine.
2. Enter its root folder.
3. Install the ruby dependencies with:
```shell
bundle
```
4. Launch IRB:
```shell
irb
```
Once in IRB:
```shell
> require './lib/account.rb'
> account = Account.new
```
5. Use the following methods with your account:

Methods         | Description
----------------|------------
deposit(amount) |  This method allows you to deposit money into the account. Use a number with up to two decimal places as the parameter.
withdraw(amount) | This method allows you to withdraw money from the account. Use a number with up to two decimal places as the parameter.
print_statement | This method will print your account statement to the console.

You will something like this in your terminal:

![](./images/bank-tech-test-example.png)

### Testing

To run the tests and check everything is working run:
```shell
rspec
```
This will show you test results and code coverage like this:
```shell
Finished in 0.0461 seconds (files took 0.39105 seconds to load)
11 examples, 0 failures


COVERAGE: 100.00% -- 108/108 lines in 2 files
```
You can also check the linting by running:
```shell
rubocop
```
This should return:
```shell
2 files inspected, no offenses detected
```

## Dependencies

This project has no production dependencies, all the dependencies are ruby gems are for testing and development.

Gem | Description
----|----------
rspec | This runs our unit and feature tests
rubocop | This is a ruby code linter.
simplecov | This tests code coverage.
simplecov-console | This displays code coverage in the console.

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

```shell
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
```shell
> account = Account.new
> account.deposit(1000, "10/01/2012")
> account.print
date || credit || debit || balance
10/01/2012 || 1000.00 || || 1000.00
```
For multiple deposits:
```shell
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

- [x] 6

> As a banker,  
> So that the system is reliable,  
> I would like it to reject false values such as strings and numbers with more than two decimal places.

- [x] 7

> As a banker,  
> So that I don't lose money,  
> I don't want users to be able to go into the negative.

- [x] 8

> As a developer,  
> So the code is easily readable,
> I would like it to be linted.

- [x] 9

> As a developer,  
> So that I know all the code is working,  
> I would like to be able to see test coverage.

## Set up

I started this project by creating an empty repository on my local machine and github. Then in the local repository, I did the following.
```shell
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

Then I refactored my code to extract two extra methods ```set_date``` and ```credit?(index)``` for readability.

## Edge cases

- [x] 6

> As a banker,  
> So that the system is reliable,  
> I would like it to reject false values such as strings and numbers with more than two decimal places.

First I  wrote a test where the user deposits a ```"string"```. Red.

- Create a method ```is_valid_number?``` to check if deposits are numbers.

Green.

Then I repeated the same process for withdrawls.

Then I wrote a test where the user deposits 5.555. Red

- Created a method ```more_than_two_decimal_places?```. 

Green.

## Code coverage and linting

- [x] 8

> As a developer,  
> So the code is easily readable,
> I would like it to be linted.

- [x] 9

> As a developer,  
> So that I know all the code is working,  
> I would like to be able to see test coverage.

I ran:
```
bundle init
```
Then I added the following gem dependencies
```ruby
gem 'rubocop'
gem 'rspec'
gem 'simplecov'
gem 'simplecov-console'
```
Then I ran:
```shell
bundle install
```
Then I added to the top of ```spec/spec_helper.rb```:
```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  SimpleCov::Formatter::Console
)
SimpleCov.start
```
Then I ran:
```
$ rspec

COVERAGE: 100.00% -- 102/102 lines in 2 files
```
100% test coverage, fanatastic!

Then I ran rubocop:
```shell
rubocop
```
Then I created ```.rubocop.yml``` and added the following code:
```ruby
AllCops:
  Exclude:
    - spec/spec_helper.rb
    - Gemfile

Documentation:
  Enabled: false

Style/FrozenStringLiteralComment:
  Enabled: false
```
This threw 97 offences! of errors. That will remind me to start with rubocop next time. Lets to fix it up!

I fixed all the erros. Phew. That taught me a lesson. Lint from the start!

## Redesign

At this point I analysed my design and realised I needed to extract some logic to some extra classes, so I created a new Domain model:

### Domain model

Objects | Messages
--------|-------
Account | deposit(amount) <br> withdraw(amount) <br> print_statment <br> @balance <br> @transactions 
Transaction |  @credit <br> @debit <br> @date <br> @balance
Statement | add(transaction) <br> STATEMENT_HEADER <br> @statement_string <br> @transactions

Now the challenge will be to maintain test coverage while extracting the logic to these two new classes.

### CRC Cards


Class: Account <br> Responsibilites|   <br> Collaborators
----------------|---------
Knows the balance <br> Know the transactions <br> Accept deposits<br>Accept withdrawals<br>  Print the statement| Transaction <br> Statement

Class: Transaction <br> Responsibilites|   <br> Collaborators
----------------|---------
Knows the debit/credit <br> Know the date <br> Knows the balance | 

Class: Statement <br> Responsibilites|   <br> Collaborators
----------------|---------
Creates a statement  <br> Knows the transactions|

By spending a bit more time planning I now feel confident that this will work out better.

## Creating two new classes

First I created the following files:
```shell
touch lib/account.rb
touch lib/transaction.rb
touch spec/account_spec.rb
touch spec/transaction_spec.rb
```

Then I began test driving the creation of these classes.

First I wrote in ```transaction_spec.rb``` a test to check that a new instantiation of a class would include a date, a credit, a debit and a balance. Red.

- Then I created an initialize function with all these values and uses the ```attr_reader``` method to make them accesible.

Green.

Then I wrote a test in ```statement_spec.rb``` to see if it could generate a correct statement using a Transaction double. Red.

- Then I hardcoded the solution.

Green

Next I wrote another test with another Transaction double for two deposits. Red.

 - I added in a working solution that updates with each deposit.

Green.

Wrote a test for a withdrawl transaction in ```statement_spec```. Red.

 - I had to update the add method to deal with debits.

Green.

Then I refactored to code to make its clearer to read, by extracting an extra private method out.

## Refactoring the Account class to use the new classes

Next I have to refactor ```account.rb``` to use two new classes, while maintaining test coverage and maintaining dependency of all classes.

 - I adjusted the methods to use ```statement.rb``` and ```transaction.rb``` and it worked first time! That is the pay off from good, clear planning. Amazing!

Then I refactored all the the classes to work harmoniously in the most elegant and simple way possible. I did this multiple times.

## Dependency Injection

Currenly all my classes are not fully independent. Lets fix that!

- First I changed my initialize method in ```account.rb``` from:
```ruby
def initialize
  @balance = 0
  @statement = Statement.new
end
```
To:
```ruby
def initialize(statement = Statement.new, transaction = Transaction)
  @balance = 0
  @statement = statement
  @transaction = transaction
end
```
Then I updated the following line on the  ```deposit``` and ```withdraw``` methods accordingly:
```ruby
transaction = Transaction.new(amount, 'credit')
```
To:
```ruby
transaction = @transaction.new(amount, 'debit')
```
This means in the I can now inject the class objects I like, no longer is ```account.rb``` dependent on ```transaction.rb``` and ```statement.rb```.

Time to update the tests to take advantage of this!

Here is how I updated my tests:
```ruby
date = Time.new(2012, 1, 10, 12)
it 'accepts a deposits of 10.55 and prints the statement' do
  allow(Time).to receive(:now).and_return(date)
  subject.deposit(10.55)
  expect { subject.print_statement }.to output('' \
    "date || credit || debit || balance\n" \
    "10/01/2012 || 10.55 || || 10.55\n").to_stdout
end
```
To:
```ruby
it 'accepts a deposits of 10.55 and prints the statement' do
  transaction_double = double :Transaction, new: ''
  statement_double = double :Statement,
                            add: '',
                            content: "10/01/2012 || 10.55 || || 10.55\n"
  account = Account.new(statement_double, transaction_double)
  account.deposit(10.55)
  expect { account.print_statement }.to output('' \
    "date || credit || debit || balance\n" \
    "10/01/2012 || 10.55 || || 10.55\n").to_stdout
end
```
As you can see I have created doubles for the ```Transaction``` and ```Statement``` classes, this now means these tests will pass even if those components break.

I then purposely broke ```transaction.rb``` and ```statment.rb``` just to check this works, the tests still pass! Fantastic, I have implemented total dependency injection, and all my classes can now be tested in isolation.

## Extra edge case

- [x] 7

> As a banker,  
> So that I don't lose money,  
> I don't want users to be able to go into the negative.

This edgecase wasn't set out in the user requirements, so I left it to the end and then set out to fix it once everything else was done.

I wrote a test where the user withdraws money on an empty balance. Red

- I added an extra check in the transaction class that doesn't allow this.

Green.

## Final notes

I have thoroughly enjoyed this project, working on getting a small and relatively simple application to the highest quality possible. I have learnt a lot, and consolidated my knowledge of dependency injection, and learned the importance of planning properly before embarking on building any project/code.

Thanks for reading,

Tom