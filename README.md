# Bank tech test

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

## Planning

Objects | Messages 
--------|--------
Account | deposit(amount, date) <br> withdrawl(amount, date) <br> print
