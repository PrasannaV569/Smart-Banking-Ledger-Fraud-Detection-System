```
**Smart-Banking-Ledger-Fraud-Detection-System**
A robust, secure, and analytical relational database blueprint designed for a modern FinTech application. This project models core banking functionalities—including customer profiling, multi-account management,and transaction ledgering—while implementing strict database-level security protocols and real-time ledger tracking.

🚀 **Key Features**
* Robust Schema Design: Normalizes customer data, multi-type bank accounts (savings, checking), and financial transactions with enforced cascading deletes to maintain absolute referential integrity.
* Database-Level Fraud Mitigation: Features an advanced BEFORE INSERT trigger acting as an automated gatekeeper to evaluate transaction legitimacy before writing to the ledger.
* Real-Time Balance Analytics: Leverages SQL window functions to dynamically compute transaction-by-transaction running balances without altering stored ledger records.

🛠️ **Tech Stack**
Database Engine: MySQL
Concepts Used: Data Definition Language (DDL), Data Manipulation Language (DML), Database Triggers, Error/Exception Signaling (SQLSTATE), Window Functions.

📐 **Database Architecture & Schema**
The system organizes data across three primary tables, utilizing auto_increment primary keys and strict check constraints:

  ┌───────────────┐          ┌───────────────┐          ┌──────────────────┐
  │   CUSTOMERS   │          │   ACCOUNTS    │          │   TRANSACTIONS   │
  ├───────────────┤          ├───────────────┤          ├──────────────────┤
  │ customer_id   │1 ─── 1:N │ account_id    │1 ─── 1:N │ transaction_id   │
  │ first_name    │          │ customer_id   │          │ account_id       │
  │ last_name     │          │ account_type  │          │ amount           │
  │ risk_score    │          └───────────────┘          │ transaction_type │
  │ created_at    │                                     │ location         │
  └───────────────┘                                     │ timestamp        │
                                                        └──────────────────┘

1. customers: Tracks basic profile data alongside a dynamic risk_score restricted to an safe interval between 0 and 100. 
2. accounts: Allows individual customers to hold multiple distinct account configurations(savings or checking).
3. transactions: Stores an immutable ledger recording deposit/withdrawal types, numerical asset changes, geolocation descriptors, and precise timestamps. 

🔒**Advanced Security Implementations**
The core logic of this database relies on the automated trigger before_transaction_insert defined in SQL_Script.sql. This ensures that application-level errors or malicious API requests are blocked directly at thedatabase layer. 

1. ***Balance Safety Verification***
    Before a withdrawal is authorized, the trigger calculates the historical sum of the specific account's balances. If the requested withdrawal pushes the account balance below zero, the execution is terminated immediately:
    ____________________________________________________________________________________
    | SQL                                                                              |
    |if new.transaction_type = 'Withdrawal' and (current_balance + new.amount) < 0 then|
    |signal sqlstate '45000'                                                           |
    |SET MESSAGE_TEXT = 'Transaction Denied: Insufficient funds for this withdrawal.'; |
    |  end if;                                                                         |
    |__________________________________________________________________________________|
2. ***Velocity Violation & Cloned Card Prevention:***
    To catch geo-velocity fraud (cloned cards processing across distances impossible by travel), the trigger compares the incoming transaction's location and timestamp against the account's immediate previous record. If the locations differ and the elapsed time is under 10 minutes, the system raises an exception:

    ____________________________________________________________________________________________________
   |SQLIF last_location IS NOT NULL AND last_location <> NEW.location THEN                              |
   |SET time_diff_minutes = TIMESTAMPDIFF(MINUTE, last_time, NEW.timestamp);                            | 
   |if time_diff_minutes < 10 then                                                                      |
   |     signal sqlstate '45000'                                                                        | 
   |    SET MESSAGE_TEXT = 'Transaction Blocked: Security Alert - Impossible Fraud Velocity Detected.'; |
   |end if;                                                                                             |
   |END IF;                                                                                             |
   |____________________________________________________________________________________________________|


📊 **Analytics & Reporting**
Instead of hardcoding running balances into the database tables (which causes race conditions and locking issues), this system utilizes a partition-based analytical query to evaluate real-time financial states:
 _______________________________________________________________________________________________________________
|SQLSELECT transaction_id, account_id, timestamp, location, amount,                                             |
|      SUM(amount) OVER (PARTITION BY account_id ORDER BY timestamp ASC, transaction_id ASC) AS running_balance |
|FROM transactions                                                                                              |
|ORDER BY timestamp, transaction_id;                                                                            |
|_______________________________________________________________________________________________________________|

💻 **How to Run**
1. Clone this repository to your local system
2. Open your preferred MySQL client (such as MySQL Workbench or Command Line Client).
3. Open and execute the provided file: SQL_Script.
4. Review the test cases included at the bottom of the script to observe the security triggers rejecting fraudulent input queries actively.

📝 **Project Context**
*This project was built to practically apply and showcase skills verified by the HackerRank SQL Intermediate Certification.*

```
