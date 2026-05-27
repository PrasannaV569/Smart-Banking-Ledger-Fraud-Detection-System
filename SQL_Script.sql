Create database smart_banking;
use smart_banking;


--  ____________________________________________________________________________________________________________________________
-- |TABLE CREATION																												|
-- |____________________________________________________________________________________________________________________________|

-- customers taable
create table customers (
	customer_id int auto_increment primary key,
    frist_name varchar(50) Not null,
    last_name varchar(50)not null,
    risk_score int default 100 check (risk_score between 0 and 100),
    created_at timestamp default current_timestamp
);

alter table customers rename column frist_name to first_name;
-- Accounts table
create table accounts(
	account_id int auto_increment primary key,
    customer_id int not null,
    account_type enum('checking','saving') not null,
    foreign key (customer_id) references customers(customer_id) on delete cascade
);

ALTER TABLE accounts 
    MODIFY COLUMN account_type ENUM('checking', 'savings') NOT NULL;

-- transaction table
create table transactions(
	transaction_id int auto_increment primary key,
    account_id int not null,
    amount decimal(10,2) not null,
    transaction_type enum('deposit','Withdrawal') not null,
    location varchar(150) not null,
    timestamp datetime not null,
    foreign key (account_id) REFERENCES accounts(account_id) on delete cascade
);
--  ________________________________________________________________________________________________________________________
-- | DATA INSERTION																											|
-- |________________________________________________________________________________________________________________________|
INSERT INTO customers (customer_id, first_name, last_name, risk_score, created_at) VALUES
(1, 'Arjun', 'Sharma', 95, '2026-01-01 09:00:00'),
(2, 'Priya', 'Patel', 88, '2026-01-02 10:15:00'),
(3, 'Rohan', 'Das', 45, '2026-01-03 14:30:00'),
(4, 'Deepa', 'Raman', 99, '2026-01-05 11:00:00'),
(5, 'Vikram', 'Singh', 72, '2026-01-06 16:45:00'),
(6, 'Ananya', 'Rao', 61, '2026-01-08 13:20:00'),
(7, 'Sanjay', 'Gupta', 35, '2026-01-10 11:00:00'),
(8, 'Meera', 'Nair', 92, '2026-01-12 10:30:00'),
(9, 'Aditya', 'Verma', 82, '2026-01-14 15:10:00'),
(10, 'Kiran', 'Joshi', 78, '2026-01-15 09:15:00'),
(11, 'Amit', 'Mishra', 85, '2026-01-18 14:22:00'),
(12, 'Neha', 'Reddy', 91, '2026-01-20 10:45:00'),
(13, 'Rahul', 'Kumar', 55, '2026-01-22 12:30:00'),
(14, 'Poojah', 'Choudhury', 96, '2026-01-25 09:05:00'),
(15, 'Aman', 'Mehta', 40, '2026-01-27 15:40:00'),
(16, 'Sneha', 'Pillai', 89, '2026-01-29 11:15:00'),
(17, 'Vijay', 'Yadav', 67, '2026-02-01 16:20:00'),
(18, 'Swati', 'Kulkarni', 94, '2026-02-03 10:00:00'),
(19, 'Rajesh', 'Sen', 32, '2026-02-05 14:10:00'),
(20, 'Divya', 'Saxena', 80, '2026-02-07 09:55:00'),
(21, 'Harish', 'Prasad', 76, '2026-02-10 11:35:00'),
(22, 'Kavita', 'Bose', 87, '2026-02-12 13:12:00'),
(23, 'Manish', 'Tiwari', 48, '2026-02-15 15:50:00'),
(24, 'Ritu', 'Deshmukh', 97, '2026-02-18 09:40:00'),
(25, 'Gaurav', 'Jha', 63, '2026-02-20 14:25:00'),
(26, 'Preeti', 'Malhotra', 74, '2026-02-22 10:50:00'),
(27, 'Sandeep', 'Chawla', 29, '2026-02-25 11:15:00'),
(28, 'Isha', 'Kapoor', 93, '2026-02-27 16:05:00'),
(29, 'Nitin', 'Shah', 81, '2026-03-01 13:45:00'),
(30, 'Jyoti', 'Sharma', 84, '2026-03-03 09:30:00'),
(31, 'Abhishek', 'Puri', 70, '2026-03-05 15:22:00'),
(32, 'Renu', 'Bhardwaj', 90, '2026-03-08 10:10:00'),
(33, 'Dev', 'Anand', 52, '2026-03-10 12:40:00'),
(34, 'Shalini', 'Hedge', 98, '2026-03-12 11:55:00'),
(35, 'Varun', 'Grover', 38, '2026-03-15 14:18:00'),
(36, 'Aarti', 'Mani', 86, '2026-03-18 10:25:00'),
(37, 'Vivek', 'Nanda', 79, '2026-03-20 16:50:00'),
(38, 'Suman', 'Rani', 77, '2026-03-22 09:05:00'),
(39, 'Tarun', 'Soni', 42, '2026-03-25 13:30:00'),
(40, 'Megha', 'Bhatt', 95, '2026-03-27 11:12:00'),
(41, 'Pankaj', 'Tripathi', 73, '2026-04-01 15:00:00'),
(42, 'Komal', 'Pandey', 83, '2026-04-03 10:40:00'),
(43, 'Rakesh', 'Ranjan', 50, '2026-04-05 12:15:00'),
(44, 'Usha', 'Lal', 96, '2026-04-08 09:25:00'),
(45, 'Vinay', 'Joshi', 31, '2026-04-10 14:55:00'),
(46, 'Sita', 'Mishra', 88, '2026-04-12 11:30:00'),
(47, 'Alok', 'Dubey', 75, '2026-04-15 16:10:00'),
(48, 'Kiran', 'Thakur', 82, '2026-04-18 10:05:00'),
(49, 'Pradeep', 'Gill', 47, '2026-04-20 13:40:00'),
(50, 'Rashmi', 'Desai', 91, '2026-04-22 09:50:00');

select * from customers;

INSERT INTO accounts (account_id, customer_id, account_type) VALUES
(101, 1, 'Checking'),
(102, 1, 'Savings'),   -- Customer 1 has two accounts
(103, 2, 'Checking'),
(104, 3, 'Checking'),
(105, 4, 'Checking'),
(106, 4, 'Savings'),   -- Customer 4 has two accounts
(107, 5, 'Checking'),
(108, 6, 'Checking'),
(109, 7, 'Checking'),
(110, 8, 'Checking'),
(111, 8, 'Savings'),   -- Customer 8 has two accounts
(112, 9, 'Checking'),
(113, 10, 'Checking'),
(114, 11, 'Checking'),
(115, 12, 'Checking'),
(116, 13, 'Checking'),
(117, 14, 'Checking'),
(118, 15, 'Checking'),
(119, 16, 'Checking'),
(120, 17, 'Checking'),
(121, 18, 'Checking'),
(122, 19, 'Checking'),
(123, 20, 'Checking'),
(124, 21, 'Checking'),
(125, 22, 'Checking'),
(126, 23, 'Checking'),
(127, 24, 'Checking'),
(128, 25, 'Checking'),
(129, 26, 'Checking'),
(130, 27, 'Checking'),
(131, 28, 'Checking'),
(132, 29, 'Checking'),
(133, 30, 'Checking'),
(134, 31, 'Checking'),
(135, 32, 'Checking'),
(136, 33, 'Checking'),
(137, 34, 'Checking'),
(138, 35, 'Checking'),
(139, 36, 'Checking'),
(140, 37, 'Checking'),
(141, 38, 'Checking'),
(142, 39, 'Checking'),
(143, 40, 'Checking'),
(144, 41, 'Checking'),
(145, 42, 'Checking'),
(146, 43, 'Checking'),
(147, 44, 'Checking'),
(148, 45, 'Checking'),
(149, 46, 'Checking'),
(150, 47, 'Checking');

select * from accounts;
INSERT INTO transactions (account_id, amount, transaction_type, location, timestamp) VALUES
-- Account 111 Activity (Meera)
(111, -10000.00, 'Withdrawal', 'Real Estate Advance', '2026-05-02 11:00:00'),
(111, -500.00, 'Withdrawal', 'Online App Store', '2026-05-04 14:00:00'),

-- Account 112 Activity (Aditya)
(112, -450.00, 'Withdrawal', 'Pune Fuel Station', '2026-05-03 10:30:00'),
(112, -1200.00, 'Withdrawal', 'Pune Hypermarket', '2026-05-05 18:00:00'),

-- Account 114 Activity (Amit)
(114, -2000.00, 'Withdrawal', 'Jaipur Resort Hotel', '2026-05-04 11:00:00'),
(114, -800.00, 'Withdrawal', 'Jaipur Handicrafts', '2026-05-05 15:30:00'),

-- Account 116 Activity (Rahul)
(116, -150.00, 'Withdrawal', 'Streaming Service Sub', '2026-05-03 00:05:00'),
(116, -2500.00, 'Withdrawal', 'Online Flight Ticket', '2026-05-06 09:15:00'),

-- Account 117 Activity (Poojah)
(117, -4000.00, 'Withdrawal', 'Jewelry Store Payment', '2026-05-04 16:45:00'),
(117, -120.00, 'Withdrawal', 'Cab Service Booking', '2026-05-05 08:20:00'),

-- Account 119 Activity (Sneha)
(119, -3500.00, 'Withdrawal', 'Chandigarh Boutique', '2026-05-04 14:00:00'),
(119, -600.00, 'Withdrawal', 'Bookstore Purchase', '2026-05-07 11:10:00'),

-- Account 120 Activity (Vijay)
(120, -1200.00, 'Withdrawal', 'Bhopal Hardware Store', '2026-05-04 10:15:00'),
(120, -3000.00, 'Withdrawal', 'Bhopal Medical Care', '2026-05-08 16:30:00'),

-- Account 121 Activity (Swati)
(121, -800.00, 'Withdrawal', 'Online Cosmetic Order', '2026-05-05 13:00:00'),

-- Account 123 Activity (Divya)
(123, -2500.00, 'Withdrawal', 'Surat Textile Market', '2026-05-04 15:20:00'),
(123, -1100.00, 'Withdrawal', 'Surat Restaurant Treat', '2026-05-06 20:45:00'),

-- Account 124 Activity (Harish)
(124, -4000.00, 'Withdrawal', 'Appliance Repair Cost', '2026-05-05 11:00:00'),
(124, -900.00, 'Withdrawal', 'Supermarket Checkout', '2026-05-08 14:15:00'),

-- Account 127 Activity (Ritu)
(127, -5000.00, 'Withdrawal', 'Mutual Fund Investment', '2026-05-05 10:00:00'),
(127, -450.00, 'Withdrawal', 'Coffee House Gathering', '2026-05-08 17:00:00'),

-- Account 129 Activity (Preeti)
(129, -2000.00, 'Withdrawal', 'Thane Apparel Outlet', '2026-05-05 12:30:00'),
(129, -1500.00, 'Withdrawal', 'Thane Gas Station', '2026-05-09 09:45:00'),

-- Account 131 Activity (Isha)
(131, -6000.00, 'Withdrawal', 'Laptop Downpayment', '2026-05-06 14:00:00'),

-- Account 132 Activity (Nitin)
(132, -1800.00, 'Withdrawal', 'Kochi Seafood Dining', '2026-05-05 21:00:00'),

-- Account 133 Activity (Jyoti)
(133, -3400.00, 'Withdrawal', 'Vizag Resort Booking', '2026-05-06 10:30:00'),

-- Account 135 Activity (Renu)
(135, -4500.00, 'Withdrawal', 'Furniture Store Bill', '2026-05-06 15:00:00'),

-- Account 137 Activity (Shalini)
(137, -2200.00, 'Withdrawal', 'Varanasi Silk Emporium', '2026-05-06 11:15:00'),

-- Account 139 Activity (Aarti)
(139, -5500.00, 'Withdrawal', 'Fitness Club Membership', '2026-05-07 07:00:00'),

-- Account 140 Activity (Vivek)
(140, -1900.00, 'Withdrawal', 'Agra Auto Service', '2026-05-06 16:30:00'),

-- Account 143 Activity (Megha)
(143, -3000.00, 'Withdrawal', 'Gwalior Hotel Stay', '2026-05-07 12:00:00'),

-- Account 146 Activity (Komal)
(146, -4000.00, 'Withdrawal', 'Digital Camera Store', '2026-05-07 14:45:00'),

-- Account 150 Activity (Usha)
(150, -8000.00, 'Withdrawal', 'Insurance Policy Premium', '2026-05-07 10:00:00'),

-- Low Balance Safety Test Baselines (For checking the trigger later)
(104, -40.00, 'Withdrawal', 'Chennai Tea Stall', '2026-05-02 08:00:00'),
(108, -500.00, 'Withdrawal', 'Hyderabad Food Stall', '2026-05-02 09:00:00'),
(113, -700.00, 'Withdrawal', 'Ahmedabad Fast Food', '2026-05-02 19:30:00'),
(118, -180.00, 'Withdrawal', 'Patna Local Bus', '2026-05-03 07:45:00'),
(122, -120.00, 'Withdrawal', 'Ranchi Sweet Shop', '2026-05-03 16:00:00'),
(126, -550.00, 'Withdrawal', 'Nagpur Newsstand', '2026-05-04 11:15:00'),
(130, -380.00, 'Withdrawal', 'Bhubaneswar Rickshaw', '2026-05-04 12:20:00'),
(134, -320.00, 'Withdrawal', 'Rajkot Corner Store', '2026-05-05 10:05:00'),
(138, -480.00, 'Withdrawal', 'Srinagar Local Market', '2026-05-05 15:40:00'),
(142, -800.00, 'Withdrawal', 'Guwahati Juice Bar', '2026-05-06 09:15:00'),
(145, -850.00, 'Withdrawal', 'Vijayawada Stationary', '2026-05-06 14:00:00'),
(149, -700.00, 'Withdrawal', 'Kota Print Shop', '2026-05-07 11:30:00'),

-- Scattered Random Deposits to pad out the ledger data
(103, 1500.00, 'Deposit', 'ATM Cash Deposit', '2026-05-08 12:00:00'),
(107, 2200.00, 'Deposit', 'Cash Deposit', '2026-05-09 11:00:00'),
(112, 1000.00, 'Deposit', 'Online Transfer', '2026-05-10 14:00:00'),
(114, 3000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(117, 4500.00, 'Deposit', 'Online Transfer', '2026-05-11 16:00:00'),
(119, 2000.00, 'Deposit', 'Cash Deposit', '2026-05-12 10:15:00'),
(123, 5000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(124, 1500.00, 'Deposit', 'ATM Cash Deposit', '2026-05-12 13:00:00'),
(127, 6000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(129, 3500.00, 'Deposit', 'Online Transfer', '2026-05-13 15:30:00'),
(131, 8000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(135, 7500.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(137, 4000.00, 'Deposit', 'Online Transfer', '2026-05-14 11:00:00'),
(139, 9000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(143, 5000.00, 'Deposit', 'Online Transfer', '2026-05-15 14:20:00'),
(146, 8000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00'),
(150, 12000.00, 'Deposit', 'Salary Credit', '2026-05-10 09:00:00');

SELECT COUNT(*) FROM transactions;
-- _____________________________________________________________________________________________________________________________________
-- |USING TRIGGERS TO GUARD THE DATABASE																								|
-- |____________________________________________________________________________________________________________________________________|
DELIMITER $$

create trigger before_transaction_insert 
before insert on transactions for each row
begin
	declare current_balance decimal(10,2);
    declare last_location varchar(100);
    declare last_time datetime;
    DECLARE time_diff_minutes INT;
    -- 1. Balance safety check
    select coalesce(sum(Amount), 0) into current_balance from transactions 
    where account_id = NEW.account_id;
    
    if new.transaction_type = 'Withdrawal' and (current_balance + new.amount) < 0 then
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'Transaction Denied: Insufficient funds for this withdrawal.';
    end if;
    
    -- 2. Velocity violation prevention
    SELECT location, timestamp INTO last_location, last_time
    FROM transactions
    WHERE account_id = NEW.account_id
    ORDER BY timestamp DESC
    LIMIT 1;
    
    IF last_location IS NOT NULL AND last_location <> NEW.location THEN
    SET time_diff_minutes = TIMESTAMPDIFF(MINUTE, last_time, NEW.timestamp);
		if time_diff_minutes < 10 then
        signal sqlstate '45000'
        SET MESSAGE_TEXT = 'Transaction Blocked: Security Alert - Impossible Fraud Velocity Detected.';
        end if;
	end if;
end$$

delimiter ;

-- 1. Verification query for testing the 'before_transaction_insert' trigger
INSERT INTO transactions (account_id, amount, transaction_type, location, timestamp) 
VALUES (104, -500.00, 'Withdrawal', 'Chennai Luxury Mall', '2026-05-20 12:00:00');
-- 2. First, a normal transaction in Delhi
INSERT INTO transactions (account_id, amount, transaction_type, location, timestamp) 
VALUES (103, -100.00, 'Withdrawal', 'Delhi ATM', '2026-05-20 12:00:00');
-- 3. 3 minutes later, the cloned card tries to pull money in New York
INSERT INTO transactions (account_id, amount, transaction_type, location, timestamp) 
VALUES (103, -500.00, 'Withdrawal', 'New York Terminal', '2026-05-20 12:03:00');

--  ________________________________________________________________________________________________________________________
-- | WINDOW FUNCTION FOR RUNNING BALANCE 																					|
-- |________________________________________________________________________________________________________________________|
select transaction_id, account_id, timestamp, location, amount,
	sum(amount) over (partition by account_id order by timestamp asc, transaction_id asc) as running_balance
    from transactions
    order by timestamp, transaction_id;




