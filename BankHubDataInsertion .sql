-- Step 01) Valid Data Insertion for (A)BankSchema.FederalGovt
INSERT INTO BankSchema.Federal_Govt (Federal_Govt_ID, Govt_Name, Country_of_Operation, Established_Date, End_Date, Email, Status)
VALUES 
('FG001', 'George Washington Agency', 'USA', '1789-04-30', '1797-03-04', 'washington@us.gov', 'inactive'),
('FG002', 'Abraham Lincoln Foundation', 'USA', '1861-03-04', '1865-04-15', 'lincoln@us.gov', 'inactive'),
('FG003', 'Theodore Roosevelt Commission', 'USA', '1901-09-14', '1909-03-04', 'theodore@us.gov', 'inactive'),
('FG004', 'Franklin Roosevelt Institute', 'USA', '1933-03-04', '1945-04-12', 'roosevelt@us.gov', 'inactive'),
('FG005', 'John F. Kennedy Center', 'USA', '1961-01-20', '1963-11-22', 'kennedy@us.gov', 'inactive'),
('FG006', 'Ronald Reagan Administration', 'USA', '1981-01-20', '1989-01-20', 'reagan@us.gov', 'inactive'),
('FG007', 'Barack Obama Initiative', 'USA', '2009-01-20', '2017-01-20', 'obama@us.gov', 'inactive'),
('FG008', 'Donald Trump Office', 'USA', '2017-01-20', '2021-01-20', 'trump@us.gov', 'inactive'),
('FG009', 'Joe Biden Executive Agency', 'USA', '2021-01-20', NULL, 'biden@us.gov', 'active');

Select * from BankSchema.Federal_Govt;

-- ===================================================================================================================
-- Step 02) Valid Data Insertion for (B)BankSchema.Bank
INSERT INTO BankSchema.Bank (Bank_ID, Federal_Govt_ID, Bank_Name, Bank_Type, Bank_Established_Date, Contact_number, Email, Website)
VALUES
('B001', 'FG001', 'Bank of America', 'Private', '1904-10-17', '9876543210', 'info@bofa.com', 'www.bankofamerica.com'),
('B002', 'FG002', 'JPMorgan Chase', 'Private', '1871-12-01', '1234567890', 'contact@jpmorgan.com', 'www.jpmorganchase.com'),
('B003', 'FG003', 'Wells Fargo', 'Private', '1852-03-18', '1122334455', 'support@wellsfargo.com', 'www.wellsfargo.com'),
('B004', 'FG001', 'Citibank', 'Private', '1812-06-16', '2233445566', 'service@citibank.com', 'www.citi.com'),
('B005', 'FG002', 'Goldman Sachs', 'Private', '1869-11-01', '3344556677', 'info@goldmansachs.com', 'www.goldmansachs.com'),
('B006', 'FG003', 'Morgan Stanley', 'Private', '1935-09-16', '4455667788', 'support@morganstanley.com', 'www.morganstanley.com'),
('B008', 'FG002', 'U.S. Bank', 'Public', '1863-07-13', '6677889900', 'info@usbank.com', 'www.usbank.com'),
('B009', 'FG003', 'Truist Financial', 'Private', '1872-09-15', '7788990011', 'support@truist.com', 'www.truist.com'),
('B010', 'FG001', 'Capital One', 'Private', '1994-07-21', '8899001122', 'info@capitalone.com', 'www.capitalone.com'),
('B011', 'FG002', 'TD Bank', 'Private', '1855-02-01', '9900112233', 'contact@td.com', 'www.td.com'),
('B012', 'FG003', 'Fifth Third Bank', 'Private', '1858-06-17', '1011121314', 'info@53.com', 'www.53.com'),
('B013', 'FG001', 'KeyBank', 'Private', '1825-11-12', '1112131415', 'support@keybank.com', 'www.keybank.com'),
('B014', 'FG002', 'HSBC Bank USA', 'Private', '1865-01-01', '1213141516', 'info@hsbc.com', 'www.hsbc.com'),
('B015', 'FG003', 'BBVA USA', 'Private', '1964-03-01', '1314151617', 'contact@bbva.com', 'www.bbva.com');

Select * from BankSchema.Bank;

-- ===================================================================================================================
--Step 03) Valid Data Insertion for (C)BankSchema.Current_Account
INSERT INTO BankSchema.Current_Account (Current_Account_ID, Description, Interest_Rate)
VALUES 
('CA001', 'Basic Checking Account', 0.05),   -- Valid, interest rate is positive
('CA002', 'High Yield Savings Account', 2.25),
('CA003', 'Student Checking Account', 0.00),  
('CA004', 'Senior Citizens Account', 1.75),
('CA005', 'Business Checking Account', 0.25),
('CA006', 'Premium Checking Account', 0.50),
('CA007', 'Youth Savings Account', 1.00),
('CA008', 'Military Checking Account', 1.50),
('CA009', 'Non-Profit Organization Account', 0.75),
('CA010', 'Health Savings Account', 0.75);

Select * from BankSchema.Current_Account;

-- ===================================================================================================================
--Step 04) Valid Data Insertion for (D)BankSchema.Loan_Products
INSERT INTO BankSchema.Loan_Products (Loan_Product_ID, Loan_Type, Interest_Rate)
VALUES 
('LP001', 'Home Loan', 3.75),
('LP002', 'Auto Loan', 4.25),
('LP003', 'Personal Loan', 5.50),
('LP004', 'Student Loan', 2.99),
('LP005', 'Small Business Loan', 6.00),
('LP006', 'Debt Consolidation Loan', 5.00),
('LP007', 'Medical Loan', 4.50),
('LP008', 'Vacation Loan', 6.25),
('LP009', 'Bridge Loan', 7.00),
('LP010', 'FHA Loan', 3.25);

Select * from BankSchema.Loan_Products;

-- ===================================================================================================================
--Step 05) Valid Data Insertion for (E)BankSchema.Investment_Option
INSERT INTO BankSchema.Investment_Option (Demat_Account_ID, IO_Name, Description, Amount)
VALUES 
('DA001', 'Stocks', 'High-risk, high-return', 5000.00),
('DA002', 'Mutual Funds', 'Diversified portfolio', 10000.50),
('DA003', 'Bonds', 'Stable returns', 20000.00),
('DA004', 'Real Estate', 'Long-term investment', 75000.75),
('DA005', 'Gold', 'Hedge against inflation', 1500.25),
('DA006', 'Cryptocurrency', 'High volatility, high potential returns', 1200.75),
('DA007', 'Treasury Bills', 'Short-term government securities', 5000.00),
('DA008', 'Index Funds', 'Tracks market indices, low-cost investment', 15000.00),
('DA009', 'Commodities', 'Tradeable goods like oil or silver', 3000.50),
('DA010', 'Exchange-Traded Funds', 'Diversified, flexible trading option', 8000.25);

Select * from BankSchema.Investment_Option;

-- ===================================================================================================================
--Step 06) Valid Data Insertion for (F)BankSchema.Card
INSERT INTO BankSchema.Card (Card_ID, Card_Type, Expiration_Date)
VALUES
('AMEX_Gold', 'Debit', '2025-12-31'),
('BBVA_ClearSpend', 'Forex', '2026-11-15'),
('CapitalOne_Venture', 'Credit', '2025-09-15'),
('Chase_Sapphire', 'Credit', '2026-06-15'),
('Discover_It', 'Debit', '2025-07-20'),
('FifthThird_Accelerate', 'Forex', '2026-07-25'),
('HSBC_Advance', 'Debit', '2027-03-01'),
('KeyBank_Preferred', 'Credit', '2025-12-31'),
('MasterCard_Black', 'Credit', '2026-11-30'),
('TDBank_Everyday', 'Debit', '2027-10-31'),
('Visa_Platinum', 'Forex', '2027-03-10');

Select * from BankSchema.Card;

-- ===================================================================================================================
--Step 07) Valid Data Insertion for (G)BankSchema.Savings_Account
INSERT INTO BankSchema.Savings_Account (Savings_Account_ID, Description, Interest_Rate)
VALUES
('SA001', 'High Interest savings account', 2.50),
('SA002', 'Regular savings account', 1.00),
('SA003', 'Student savings account', 1.25),
('SA004', 'Senior citizen savings account', 3.00),
('SA005', 'Joint savings account', 2.00),
('SA006', 'Premium savings account', 2.75),
('SA007', 'Business savings account', 1.50),
('SA008', 'Tax-free savings account', 2.25),
('SA009', 'Youth savings account', 1.75),
('SA010', 'Online exclusive savings account', 2.00);

Select * from BankSchema.Savings_Account;

-- ===================================================================================================================
-- Step 08) Valid Data Insertion for (H)BankSchema.Bank_Current_Account
INSERT INTO BankSchema.Bank_Current_Account (
    Bank_ID, Current_Account_ID, Start_Date, End_Date
)
VALUES
-- Bank B001
('B001', 'CA001', '2023-01-01', '2026-01-01'),
('B001', 'CA002', '2022-05-15', '2025-05-15'),

-- Bank B002
('B002', 'CA003', '2021-03-01', '2024-12-31'),
('B002', 'CA004', '2023-02-01', '2025-02-01'),

-- Bank B003
('B003', 'CA005', '2020-07-01', '2026-07-01'),
('B003', 'CA006', '2022-09-15', '2025-09-15'),

-- Bank B004
('B004', 'CA007', '2021-11-01', '2026-11-01'),
('B004', 'CA008', '2022-12-01', '2025-12-01'),

-- Bank B005
('B005', 'CA009', '2019-04-01', '2026-04-01'),
('B005', 'CA010', '2022-01-15', '2025-01-15'),

-- Bank B006
('B006', 'CA001', '2020-06-01', '2027-06-01'),
('B006', 'CA002', '2021-09-01', '2026-09-01'),

-- Bank B008
('B008', 'CA003', '2023-03-01', '2027-03-01'),
('B008', 'CA004', '2022-10-01', '2026-10-01'),

-- Bank B009
('B009', 'CA005', '2021-08-01', '2025-08-01'),
('B009', 'CA006', '2022-04-01', '2026-04-01'),

-- Bank B010
('B010', 'CA007', '2023-02-15', '2025-02-15'),
('B010', 'CA008', '2022-07-15', '2026-07-15'),

-- Bank B011
('B011', 'CA009', '2020-11-01', '2026-11-01'),
('B011', 'CA010', '2021-01-01', '2025-01-01');


Select * from BankSchema.Bank_Current_Account;

-- ===================================================================================================================
-- Step 09) Valid Data Insertion for (I)BankSchema.Bank_Loan_Products
INSERT INTO BankSchema.Bank_Loan_Products (
    Bank_ID, Loan_Product_ID, Start_Date, End_Date
)
VALUES
-- Bank B001
('B001', 'LP001', '2022-01-01', '2025-01-01'),
('B001', 'LP002', '2023-03-15', '2026-03-15'),

-- Bank B002
('B002', 'LP003', '2021-05-10', '2024-05-10'),
('B002', 'LP004', '2022-09-20', '2026-09-20'),

-- Bank B003
('B003', 'LP005', '2020-11-01', '2025-11-01'),
('B003', 'LP006', '2023-07-01', '2027-07-01'),

-- Bank B004
('B004', 'LP007', '2022-04-15', '2026-04-15'),
('B004', 'LP008', '2021-12-01', '2025-12-01'),

-- Bank B005
('B005', 'LP009', '2023-01-01', '2026-01-01'),
('B005', 'LP010', '2022-06-01', '2025-06-01'),

-- Bank B006
('B006', 'LP001', '2021-03-01', '2024-03-01'),
('B006', 'LP003', '2022-09-01', '2026-09-01'),

-- Bank B008
('B008', 'LP005', '2022-02-15', '2025-02-15'),
('B008', 'LP007', '2021-08-15', '2026-08-15'),

-- Bank B009
('B009', 'LP002', '2023-01-01', '2027-01-01'),
('B009', 'LP004', '2022-11-01', '2026-11-01'),

-- Bank B010
('B010', 'LP006', '2020-05-01', '2025-05-01'),
('B010', 'LP008', '2021-10-01', '2026-10-01'),

-- Bank B011
('B011', 'LP009', '2022-07-01', '2025-07-01'),
('B011', 'LP010', '2023-04-01', '2026-04-01');

Select * from BankSchema.Bank_Loan_Products;

-- ===================================================================================================================
-- Step 10)Valid Data Insertion for (J)BankSchema.Bank_Investment_Option
INSERT INTO BankSchema.Bank_Investment_Option (
    Bank_ID, Demat_Account_ID, Start_Date, End_Date
)
VALUES
-- Bank B001
('B001', 'DA001', '2022-01-01', '2025-01-01'),
('B001', 'DA002', '2023-03-15', '2026-03-15'),

-- Bank B002
('B002', 'DA003', '2021-05-10', '2024-05-10'),
('B002', 'DA004', '2022-09-20', '2026-09-20'),

-- Bank B003
('B003', 'DA005', '2020-11-01', '2025-11-01'),
('B003', 'DA006', '2023-07-01', '2027-07-01'),

-- Bank B004
('B004', 'DA007', '2022-04-15', '2026-04-15'),
('B004', 'DA008', '2021-12-01', '2025-12-01'),

-- Bank B005
('B005', 'DA009', '2023-01-01', '2026-01-01'),
('B005', 'DA010', '2022-06-01', '2025-06-01'),

-- Bank B006
('B006', 'DA001', '2021-03-01', '2024-03-01'),
('B006', 'DA003', '2022-09-01', '2026-09-01'),

-- Bank B008
('B008', 'DA005', '2022-02-15', '2025-02-15'),
('B008', 'DA007', '2021-08-15', '2026-08-15'),

-- Bank B009
('B009', 'DA002', '2023-01-01', '2027-01-01'),
('B009', 'DA004', '2022-11-01', '2026-11-01'),

-- Bank B010
('B010', 'DA006', '2020-05-01', '2025-05-01'),
('B010', 'DA008', '2021-10-01', '2026-10-01'),

-- Bank B011
('B011', 'DA009', '2022-07-01', '2025-07-01'),
('B011', 'DA010', '2023-04-01', '2026-04-01');

Select * from BankSchema.Bank_Investment_Option;

-- ===================================================================================================================
-- Step 11) Valid Data Insertion for (K)BankSchema.Bank_Card
INSERT INTO BankSchema.Bank_Card (Bank_ID, Card_ID, Start_Date, End_Date)
VALUES
-- JP Morgan Chase with Chase_Sapphire
('B001', 'Chase_Sapphire', '2022-03-10', '2026-11-15'),
('B001', 'Visa_Platinum', '2023-05-01', '2027-12-31'),

-- BBVA with BBVA_ClearSpend
('B002', 'BBVA_ClearSpend', '2023-01-15', '2026-11-15'),
('B002', 'Discover_It', '2021-08-15', '2027-07-20'),

-- Capital One with CapitalOne_Venture
('B003', 'CapitalOne_Venture', '2022-12-10', '2025-09-15'),
('B003', 'AMEX_Gold', '2023-06-01', '2025-12-31'),

-- HSBC with HSBC_Advance
('B004', 'HSBC_Advance', '2023-06-01', '2027-05-30'),
('B004', 'MasterCard_Black', '2022-08-10', '2026-11-30'),

-- Fifth Third with FifthThird_Accelerate
('B005', 'FifthThird_Accelerate', '2023-04-25', '2027-10-25'),
('B005', 'Visa_Platinum', '2023-07-15', '2027-03-10'),

-- TD Bank with TDBank_Everyday
('B006', 'TDBank_Everyday', '2022-05-10', '2028-06-01'),
('B006', 'Discover_It', '2023-09-01', '2026-09-01'),

-- MasterCard Bank gets MasterCard_Black
('B008', 'MasterCard_Black', '2023-02-05', '2027-10-30'),
('B008', 'Chase_Sapphire', '2023-06-15', '2027-07-15'),

-- Visa Bank gets Visa_Platinum
('B009', 'Visa_Platinum', '2023-02-01', '2027-03-10'),
('B009', 'CapitalOne_Venture', '2023-03-15', '2025-09-15'),

-- American Express with AMEX_Gold
('B010', 'AMEX_Gold', '2021-07-15', '2025-12-31'),
('B010', 'FifthThird_Accelerate', '2023-01-01', '2027-07-25'),

('B011', 'Discover_It', '2023-04-10', '2027-06-20'),
('B011', 'BBVA_ClearSpend', '2021-06-20', '2027-05-15'),

('B013', 'TDBank_Everyday', '2022-11-20', '2028-01-01'),
('B013', 'Visa_Platinum', '2023-07-15', '2027-03-10');

Select * from BankSchema.Bank_Card;

-- ===================================================================================================================
-- Step 12) Valid Data Insertion for (L)BankSchema.Bank_Savings_Account
INSERT INTO BankSchema.Bank_Savings_Account (Bank_ID, Savings_Account_ID, Start_Date, End_Date)
VALUES
-- Bank B001
('B001', 'SA001', '2020-01-01', '2025-01-01'),
('B001', 'SA002', '2019-05-15', '2026-05-15'),
-- Bank B002
('B002', 'SA003', '2021-06-10', '2025-06-10'),
('B002', 'SA004', '2018-03-25', '2027-03-25'),
-- Bank B003
('B003', 'SA005', '2020-12-01', '2026-12-01'),
('B003', 'SA006', '2019-07-15', '2025-07-15'),
-- Bank B004
('B004', 'SA007', '2020-08-20', '2026-08-20'),
('B004', 'SA008', '2021-04-10', '2027-04-10'),
-- Bank B005
('B005', 'SA009', '2019-10-01', '2026-10-01'),
('B005', 'SA010', '2022-01-01', '2025-12-31'),
-- Bank B006
('B006', 'SA001', '2021-02-15', '2026-02-15'),
('B006', 'SA002', '2020-06-30', '2027-06-30'),
-- Bank B008
('B008', 'SA005', '2019-11-05', '2026-11-05'),
('B008', 'SA006', '2022-03-20', '2025-03-20'),
-- Bank B009
('B009', 'SA007', '2020-09-01', '2026-09-01'),
('B009', 'SA008', '2018-12-10', '2027-12-10'),
-- Bank B010
('B010', 'SA009', '2021-07-15', '2026-07-15'),
('B010', 'SA010', '2019-02-25', '2025-02-25'),
-- Bank B011
('B011', 'SA001', '2020-11-20', '2026-11-20'),
('B011', 'SA002', '2021-01-10', '2025-01-10'),
-- Bank B013
('B013', 'SA003', '2019-06-15', '2025-06-15'),
('B013', 'SA004', '2020-12-01', '2026-12-01');

Select * from BankSchema.Bank_Savings_Account;

-- ===================================================================================================================
-- Step 13) (M)Customer table population
INSERT INTO CustomerSchema.Customer (
    Cust_FName, 
    Cust_LName, 
    Cust_DOB, 
    Cust_email, 
    Cust_contact, 
    Address_line_1, 
    Address_line_2, 
    City, 
    Zip
)
VALUES
    ('Michael', 'Johnson', '1990-11-10', 'michael.johnson@yahoo.com', '9876543210', '55 Elmwood Ave', NULL, 'Boston', '02108'),
    ('Jessica', 'Williams', '1985-05-05', 'jessica.williams@outlook.com', '4157896543', '202 Ocean Blvd', 'Suite 5', 'Los Angeles', '90001'),
    ('Daniel', 'Smith', '1992-07-18', 'daniel.smith@gmail.com', '3216549870', '12 Cedar Lane', NULL, 'Chicago', '60601'),
    ('Sophia', 'Hernandez', '1989-03-12', 'sophia.hernandez@hotmail.com', '2027894561', '456 Pine St', 'Unit 6A', 'San Francisco', '94102'),
    ('Liam', 'Garcia', '1994-01-15', 'liam.garcia@gmail.com', '7147891234', '789 Birch Rd', NULL, 'Houston', '77001'),
    ('Olivia', 'Martinez', '1997-09-22', 'olivia.martinez@aol.com', '3056543217', '101 Redwood Dr', 'Bldg 2', 'Miami', '33101'),
    ('Ethan', 'Rodriguez', '1991-08-05', 'ethan.rodriguez@gmail.com', '8187894321', '303 Willow Way', 'Ste 4A', 'Dallas', '75201'),
    ('Emma', 'Lopez', '1988-06-14', 'emma.lopez@example.com', '6194567890', '123 Maple Ct', NULL, 'San Diego', '92101'),
    ('James', 'Taylor', '1984-02-28', 'james.taylor@example.com', '7039876543', '405 Spruce Circle', 'Apt 7C', 'Philadelphia', '19101');

Select * from CustomerSchema.Customer;

-- ===================================================================================================================
-- Step 14) Population for (N)CustomerSchema.Customer_Bank

INSERT INTO CustomerSchema.Customer_Bank (
    Customer_ID, Bank_ID
)
VALUES
-- Customer 3 (Emily Brown) linked to multiple banks
(3, 'B001'),
(3, 'B002'),
(3, 'B004'),

-- Customer 4 (Michael Johnson) linked to multiple banks
(4, 'B003'),
(4, 'B005'),

-- Customer 5 (Jessica Williams) linked to multiple banks
(5, 'B006'),
(5, 'B009'),
(5, 'B010'),

-- Customer 6 (Daniel Smith) linked to one bank
(6, 'B008'),

-- Customer 7 (Sophia Hernandez) linked to multiple banks
(7, 'B002'),
(7, 'B013'),
(7, 'B014'),

-- Customer 8 (Liam Garcia) linked to one bank
(8, 'B001'),

-- Customer 9 (Olivia Martinez) linked to multiple banks
(9, 'B002'),
(9, 'B005'),
(9, 'B006'),

-- Customer 10 (Ethan Rodriguez) linked to one bank
(10, 'B011'),

-- Customer 11 (Emma Lopez) linked to multiple banks
(11, 'B001'),
(11, 'B003'),
(11, 'B015'),

-- Customer 12 (James Taylor) linked to one bank
(12, 'B004'),

-- Additional links to ensure all banks have at least 2 customers
(4, 'B001'),  -- JPMorgan Chase also linked to Michael Johnson
(6, 'B005'),  -- Goldman Sachs also linked to Daniel Smith
(7, 'B008'),  -- U.S. Bank also linked to Sophia Hernandez
(9, 'B010');  -- Capital One also linked to Olivia Martinez

Select * from CustomerSchema.Customer_Bank;

-- ===================================================================================================================
-- Step 15) Insert Valid Data(O)Security Log Population
OPEN SYMMETRIC KEY SecurityKey
DECRYPTION BY CERTIFICATE SecurityCert;

INSERT INTO CustomerSchema.Security_Log (LogID, Customer_ID, Activity_Type, Timestamp, IPAddress, Device_Info)
VALUES
(NEWID(), 5, 'Login', '2024-12-05 09:30:00',
        EncryptByKey(Key_GUID('SecurityKey'), CONVERT(NVARCHAR(MAX), '192.168.50.5')),
        'MacBook Pro');
       
CLOSE SYMMETRIC KEY SecurityKey;

INSERT INTO CustomerSchema.Security_Log (Customer_ID, Activity_Type, Timestamp, IPAddress, Device_Info)
VALUES 
-- Row 1
(3, 'Login', '2024-11-22 10:25:45', '192.168.0.1', 'Windows PC'),
-- Row 2
(4, 'Password Change', '2024-11-21 14:45:30', '10.0.0.5', 'iPhone 12'),
-- Row 3
(5, 'Purchase', '2024-11-22 18:30:15', '172.16.254.1', 'MacBook Pro'),
-- Row 4
(6, 'Login', '2024-11-23 08:12:45', '192.168.1.101', 'Android Tablet'),
-- Row 5
(7, 'Account Update', '2024-11-23 09:50:10', '203.0.113.42', 'iPad Pro'),
-- Row 6
(8, 'Logout', '2024-11-22 20:15:00', '198.51.100.23', 'Linux Laptop'),
-- Row 7
(9, 'Login', '2024-11-22 21:45:50', '172.16.100.200', 'Windows Desktop'),
-- Row 8
(10, 'Two-Factor Auth', '2024-11-23 07:35:25', '10.0.1.45', 'Samsung Galaxy S21'),
-- Row 9
(11, 'Purchase', '2024-11-22 16:10:05', '192.0.2.15', 'Windows Surface'),
-- Row 10
(12, 'Password Reset', '2024-11-21 12:00:00', '203.0.113.55', 'Mac Mini');

SELECT * FROM CustomerSchema.Security_Log;


-- ===================================================================================================================
-- Step 16) Insert values for (Q)CustomerSchema.Customer_Current_Account
INSERT INTO CustomerSchema.Customer_Current_Account (
    Customer_ID, Current_Account_ID
)
VALUES
-- Customer 3 (Emily Brown) linked to Bank B001 (CA001, CA002)
(3, 'CA001'),
(3, 'CA002'),

-- Customer 4 (Michael Johnson) linked to Bank B002 (CA003, CA004)
(4, 'CA003'),
(4, 'CA004'),

-- Customer 5 (Jessica Williams) linked to Banks B006 (CA001, CA002) and B009 (CA005, CA006)
(5, 'CA001'),
(5, 'CA002'),
(5, 'CA005'),
(5, 'CA006'),

-- Customer 6 (Daniel Smith) linked to Bank B008 (CA003, CA004)
(6, 'CA003'),
(6, 'CA004'),

-- Customer 7 (Sophia Hernandez) linked to Banks B002 (CA003, CA004) and B008 (CA003, CA004)
(7, 'CA003'),
(7, 'CA004'),

-- Customer 8 (Liam Garcia) linked to Bank B001 (CA001, CA002)
(8, 'CA001'),
(8, 'CA002'),

-- Customer 9 (Olivia Martinez) linked to Banks B005 (CA009, CA010) and B009 (CA005, CA006)
(9, 'CA009'),
(9, 'CA010'),
(9, 'CA005'),
(9, 'CA006'),

-- Customer 10 (Ethan Rodriguez) linked to Bank B011 (CA009, CA010)
(10, 'CA009'),
(10, 'CA010'),

-- Customer 11 (Emma Lopez) linked to Banks B001 (CA001, CA002) and B003 (CA005, CA006)
(11, 'CA001'),
(11, 'CA002'),
(11, 'CA005'),
(11, 'CA006'),

-- Customer 12 (James Taylor) linked to Bank B004 (CA007, CA008)
(12, 'CA007'),
(12, 'CA008');

Select * from CustomerSchema.Customer_Current_Account;

-- ===================================================================================================================
-- Step 17) Insert values for (U)CustomerSchema.Customer_Savings_Account
INSERT INTO CustomerSchema.Customer_Savings_Account (
    Customer_ID, Savings_Account_ID
)
VALUES
-- Customer 3 (Emily Brown) linked to Bank B001 (SA001, SA002)
(3, 'SA001'),
(3, 'SA002'),

-- Customer 4 (Michael Johnson) linked to Bank B002 (SA003, SA004)
(4, 'SA003'),
(4, 'SA004'),

-- Customer 5 (Jessica Williams) linked to Banks B006 (SA001, SA002) and B009 (SA007, SA008)
(5, 'SA001'),
(5, 'SA002'),
(5, 'SA007'),
(5, 'SA008'),

-- Customer 6 (Daniel Smith) linked to Bank B008 (SA005, SA006)
(6, 'SA005'),
(6, 'SA006'),

-- Customer 7 (Sophia Hernandez) linked to Banks B002 (SA003, SA004) and B008 (SA005, SA006)
(7, 'SA003'),
(7, 'SA004'),
(7, 'SA005'),
(7, 'SA006'),

-- Customer 8 (Liam Garcia) linked to Bank B001 (SA001, SA002)
(8, 'SA001'),
(8, 'SA002'),

-- Customer 9 (Olivia Martinez) linked to Banks B005 (SA009, SA010) and B009 (SA007, SA008)
(9, 'SA009'),
(9, 'SA010'),
(9, 'SA007'),
(9, 'SA008'),

-- Customer 10 (Ethan Rodriguez) linked to Bank B011 (SA001, SA002)
(10, 'SA001'),
(10, 'SA002'),

-- Customer 11 (Emma Lopez) linked to Banks B001 (SA001, SA002) and B003 (SA005, SA006)
(11, 'SA001'),
(11, 'SA002'),
(11, 'SA005'),
(11, 'SA006'),

-- Customer 12 (James Taylor) linked to Bank B004 (SA007, SA008)
(12, 'SA007'),
(12, 'SA008');

Select * from CustomerSchema.Customer_Savings_Account;

-- ===================================================================================================================
-- Step 18) Insert values for (R)CustomerSchema.Customer_Loan
INSERT INTO CustomerSchema.Customer_Loan (
    Loan_Product_ID, Customer_ID, Loan_Acc_Number, Application_Date, Loan_Status, Loan_Amount, Tenure
)
VALUES
-- Customer 3 (Emily Brown) linked to Bank B001 (LP001, LP002)
('LP001', 3, 'LA10001', '2022-06-15', 'In-Progress', 25000.00, 36),
('LP002', 3, 'LA10002', '2023-07-01', 'Completed', 15000.00, 24),

-- Customer 4 (Michael Johnson) linked to Bank B002 (LP003, LP004)
('LP003', 4, 'LA20001', '2021-08-01', 'In-Progress', 20000.00, 48),
('LP004', 4, 'LA20002', '2022-12-10', 'Defaulted', 10000.00, 12),

-- Customer 5 (Jessica Williams) linked to Banks B006 (LP001, LP003) and B009 (LP002, LP004)
('LP001', 5, 'LA30001', '2021-05-10', 'Completed', 30000.00, 36),
('LP003', 5, 'LA30002', '2022-11-20', 'In-Progress', 25000.00, 48),
('LP002', 5, 'LA30003', '2023-03-01', 'Completed', 12000.00, 24),
('LP004', 5, 'LA30004', '2022-08-15', 'Defaulted', 15000.00, 12),

-- Customer 6 (Daniel Smith) linked to Bank B008 (LP005, LP007)
('LP005', 6, 'LA40001', '2022-05-20', 'In-Progress', 18000.00, 36),
('LP007', 6, 'LA40002', '2023-01-01', 'Completed', 22000.00, 24),

-- Customer 7 (Sophia Hernandez) linked to Banks B002 (LP003, LP004) and B008 (LP005, LP007)
('LP003', 7, 'LA50001', '2021-07-15', 'Completed', 15000.00, 24),
('LP004', 7, 'LA50002', '2022-03-10', 'In-Progress', 18000.00, 36),
('LP005', 7, 'LA50003', '2023-02-25', 'Defaulted', 25000.00, 48),
('LP007', 7, 'LA50004', '2023-04-01', 'In-Progress', 30000.00, 36),

-- Customer 8 (Liam Garcia) linked to Bank B001 (LP001, LP002)
('LP001', 8, 'LA60001', '2022-01-01', 'Completed', 20000.00, 24),
('LP002', 8, 'LA60002', '2023-05-15', 'In-Progress', 15000.00, 36),

-- Customer 9 (Olivia Martinez) linked to Banks B005 (LP009, LP010) and B009 (LP002, LP004)
('LP009', 9, 'LA70001', '2023-01-01', 'In-Progress', 28000.00, 48),
('LP010', 9, 'LA70002', '2022-08-10', 'Completed', 15000.00, 24),
('LP002', 9, 'LA70003', '2023-06-20', 'In-Progress', 17000.00, 36),
('LP004', 9, 'LA70004', '2022-04-15', 'Completed', 12000.00, 24),

-- Customer 10 (Ethan Rodriguez) linked to Bank B011 (LP009, LP010)
('LP009', 10, 'LA80001', '2022-09-10', 'Completed', 20000.00, 36),
('LP010', 10, 'LA80002', '2023-03-15', 'In-Progress', 25000.00, 48),

-- Customer 11 (Emma Lopez) linked to Banks B001 (LP001, LP002) and B003 (LP005, LP006)
('LP001', 11, 'LA90001', '2022-06-25', 'In-Progress', 15000.00, 24),
('LP002', 11, 'LA90002', '2023-04-05', 'Completed', 18000.00, 36),
('LP005', 11, 'LA90003', '2021-11-15', 'In-Progress', 25000.00, 48),
('LP006', 11, 'LA90004', '2023-09-20', 'Completed', 30000.00, 60),

-- Customer 12 (James Taylor) linked to Bank B004 (LP007, LP008)
('LP007', 12, 'LA11001', '2022-02-15', 'Completed', 12000.00, 12),
('LP008', 12, 'LA11002', '2021-12-01', 'In-Progress', 15000.00, 24);

Select * from CustomerSchema.Customer_Loan;

-- ===================================================================================================================
-- Step 19) Insert values for (S)CustomerSchema.Customer_investment
INSERT INTO CustomerSchema.Customer_Investment (
    Customer_ID, Demat_Account_ID, Demat_Account_Number, Type_of_Investment, Portfolio_Value
)
VALUES
-- Customer 3 (Emily Brown) linked to Bank B001 (DA001, DA002)
(3, 'DA001', 'DAN10001', 'Stocks', 25000.00),
(3, 'DA002', 'DAN10002', 'Mutual', 35000.00),

-- Customer 4 (Michael Johnson) linked to Bank B002 (DA003, DA004)
(4, 'DA003', 'DAN20001', 'Bonds', 40000.00),
(4, 'DA004', 'DAN20002', 'Real Est', 50000.00),

-- Customer 5 (Jessica Williams) linked to Banks B006 (DA001, DA003) and B009 (DA002, DA004)
(5, 'DA001', 'DAN30001', 'Stocks', 55000.00),
(5, 'DA003', 'DAN30002', 'Bonds', 60000.00),
(5, 'DA002', 'DAN30003', 'Mutual', 45000.00),
(5, 'DA004', 'DAN30004', 'Real Est', 50000.00),

-- Customer 6 (Daniel Smith) linked to Bank B008 (DA005, DA007)
(6, 'DA005', 'DAN40001', 'Treasury', 35000.00),
(6, 'DA007', 'DAN40002', 'Gold', 25000.00),

-- Customer 7 (Sophia Hernandez) linked to Banks B002 (DA003, DA004) and B008 (DA005, DA007)
(7, 'DA003', 'DAN50001', 'Bonds', 45000.00),
(7, 'DA004', 'DAN50002', 'Real Est', 60000.00),
(7, 'DA005', 'DAN50003', 'Treasury', 30000.00),
(7, 'DA007', 'DAN50004', 'Gold', 35000.00),

-- Customer 8 (Liam Garcia) linked to Bank B001 (DA001, DA002)
(8, 'DA001', 'DAN60001', 'Stocks', 15000.00),
(8, 'DA002', 'DAN60002', 'Mutual', 20000.00),

-- Customer 9 (Olivia Martinez) linked to Banks B005 (DA009, DA010) and B009 (DA002, DA004)
(9, 'DA009', 'DAN70001', 'Comm', 45000.00),
(9, 'DA010', 'DAN70002', 'ETFs', 30000.00),
(9, 'DA002', 'DAN70003', 'Mutual', 40000.00),
(9, 'DA004', 'DAN70004', 'Real Est', 55000.00),

-- Customer 10 (Ethan Rodriguez) linked to Bank B011 (DA009, DA010)
(10, 'DA009', 'DAN80001', 'Comm', 25000.00),
(10, 'DA010', 'DAN80002', 'ETFs', 35000.00),

-- Customer 11 (Emma Lopez) linked to Banks B001 (DA001, DA002) and B003 (DA005, DA006)
(11, 'DA001', 'DAN90001', 'Stocks', 20000.00),
(11, 'DA002', 'DAN90002', 'Mutual', 30000.00),
(11, 'DA005', 'DAN90003', 'Treasury', 40000.00),
(11, 'DA006', 'DAN90004', 'Index', 50000.00),

-- Customer 12 (James Taylor) linked to Bank B004 (DA007, DA008)
(12, 'DA007', 'DAN11001', 'Gold', 30000.00),
(12, 'DA008', 'DAN11002', 'Real Est', 45000.00);

Select * from CustomerSchema.Customer_Investment;

-- ===================================================================================================================
-- Step 20) Table (T)CustomerSchema.Customer_Cards

-- Customer 3 (linked to B001, B002, B004; has 1 card per bank)
-- Customer 3 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('Chase_Sapphire', 3, '4000123456781001', '2026-11-15', 'Active', 10000.00), -- B001 (has Chase_Sapphire)
('BBVA_ClearSpend', 3, '4000123456782001', '2026-11-15', 'Active', 5000.00), -- B002 (has BBVA_ClearSpend)
('HSBC_Advance', 3, '4000123456783001', '2027-05-30', 'Active', 12000.00); -- B004 (has HSBC_Advance)

-- Customer 4 (linked to B001, B003, B005; has 1 card per bank)
-- Customer 4 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('Visa_Platinum', 4, '4000123456784001', '2027-12-31', 'Active', 15000.00), -- B001 (has Visa_Platinum)
('AMEX_Gold', 4, '4000123456784002', '2025-12-31', 'Active', 12000.00), -- B003 (has AMEX_Gold)
('FifthThird_Accelerate', 4, '4000123456784004', '2027-10-25', 'Active', 20000.00); -- B005 (has FifthThird_Accelerate)

-- Customer 5 (linked to B006, B009, B010; has 1 card per bank)
-- Customer 5 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('Discover_It', 5, '4000123456785001', '2026-09-01', 'Active', 7000.00), -- B006 (has Discover_It)
('CapitalOne_Venture', 5, '4000123456785003', '2025-09-15', 'Active', 15000.00), -- B009 (has CapitalOne_Venture)
('AMEX_Gold', 5, '4000123456785005', '2025-12-31', 'Active', 12000.00); -- B010 (has AMEX_Gold)

-- Customer 6 (linked to B008, B005; has 1 card per bank)
-- Customer 6 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('Chase_Sapphire', 6, '4000123456786001', '2027-07-15', 'Active', 18000.00), -- B008 (has Chase_Sapphire)
('FifthThird_Accelerate', 6, '4000123456786003', '2027-07-25', 'Active', 17000.00); -- B005 (has FifthThird_Accelerate)

-- Customer 7 (linked to B002, B008, B013, B014; has 1 card per bank)
-- Customer 7 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('BBVA_ClearSpend', 7, '4000123456787001', '2026-11-15', 'Active', 5000.00), -- B002 (has BBVA_ClearSpend)
('Chase_Sapphire', 7, '4000123456787003', '2027-07-15', 'Active', 15000.00), -- B008 (has Chase_Sapphire)
('TDBank_Everyday', 7, '4000123456787005', '2028-01-01', 'Active', 10000.00), -- B013 (has TDBank_Everyday)
('Visa_Platinum', 7, '4000123456787006', '2027-03-10', 'Active', 25000.00); -- B013 (has Visa_Platinum)

-- Customer 9 (linked to B006, B009, B010; has 1 card per bank)
-- Customer 9 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('Discover_It', 9, '4000123456789001', '2026-09-01', 'Active', 7000.00), -- B006 (has Discover_It)
('CapitalOne_Venture', 9, '4000123456789003', '2025-09-15', 'Active', 15000.00), -- B009 (has CapitalOne_Venture)
('AMEX_Gold', 9, '4000123456789005', '2025-12-31', 'Active', 12000.00); -- B010 (has AMEX_Gold)

-- Customer 10 (linked to B011; only one bank, so one card)
-- Customer 10 has only one card for B011
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('BBVA_ClearSpend', 10, '4000123456781011', '2027-05-15', 'Active', 8000.00); -- B011

-- Customer 11 (linked to B003, B015, B001; has 1 card per bank)
-- Customer 11 has a card for each of their linked banks
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('AMEX_Gold', 11, '4000123456781101', '2025-12-31', 'Active', 12000.00), -- B003 (has AMEX_Gold)
('Discover_It', 11, '4000123456781103', '2027-06-20', 'Active', 8000.00), -- B015 (has Discover_It)
('Chase_Sapphire', 11, '4000123456781104', '2026-11-15', 'Active', 10000.00); -- B001 (has Chase_Sapphire)

-- Customer 12 (linked to B004; only one bank, so one card)
-- Customer 12 has only one card for B004
INSERT INTO CustomerSchema.Customer_Cards (Card_ID, Customer_ID, Card_Number, Card_Exp_Date, Card_Status, Limit)
VALUES
('HSBC_Advance', 12, '4000123456781201', '2027-05-30', 'Active', 18000.00); -- B004

Select * from CustomerSchema.Customer_Cards;

-- ===================================================================================================================
-- Step 21) Insert data into (P)Beneficiary Table
INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
(3, 'Daniel', 'Smith', '6-CA003', '123456789'),  -- Customer 3 (Emily) transfers to Customer 6 (Daniel) with savings account SA006
(6, 'Emily', 'Brown', '3-SA002', '987654321'),  -- Customer 6 (Daniel) transfers to Customer 3 (Emily) with savings account SA002
(4, 'Jessica', 'Williams', '5-SA001', '112233445'),  -- Customer 4 (James) transfers to Customer 5 (Olivia) with savings account SA001
(5, 'Michael', 'Johnson', '4-SA003', '223344556'),  -- Customer 5 (Olivia) transfers to Customer 4 (James) with savings account SA003
(3, 'Olivia', 'Martinez', '9-CA010', '334455667'),  -- Customer 3 (Emily) transfers to Customer 9 (Sophia) with savings account SA007
(9, 'Emily', 'Brown', '3-SA001', '445566778'),  -- Customer 9 (Sophia) transfers to Customer 3 (Emily) with savings account SA001
(5, 'Sophia', 'Hernandez', '7-SA006', '556677889'),  -- Customer 5 (Olivia) transfers to Customer 7 (Olivia) with savings account SA006
(7, 'Jessica', 'Williams', '5-SA002', '667788990'),  -- Customer 7 (Olivia) transfers to Customer 5 (Olivia) with savings account SA002
(6, 'Liam', 'Garcia', '8-CA002', '778899001'),  -- Customer 6 (Daniel) transfers to Customer 8 (Olivia) with savings account SA002
(8, 'Daniel', 'Smith', '6-CA004', '889900112'),  -- Customer 8 (Olivia) transfers to Customer 6 (Daniel) with savings account SA005
(10, 'Emma', 'Lopez', '11-SA006', '990011223'),  -- Customer 10 (Sophia) transfers to Customer 11 (Olivia) with savings account SA006
(11, 'Ethan', 'Rodriguez', '10-CA010', '101112233'),  -- Customer 11 (Olivia) transfers to Customer 10 (Sophia) with savings account SA002
(4, 'Liam', 'Garcia', '8-SA001', '112233445'),  -- Customer 4 (James) transfers to Customer 8 (Olivia) with savings account SA001
(8, 'Michael', 'Johnson', '4-SA004', '223344556'),  -- Customer 8 (Olivia) transfers to Customer 4 (James) with savings account SA004
(5, 'Olivia', 'Martinez', '9-CA006', '334455667'),  -- Customer 5 (Olivia) transfers to Customer 9 (Sophia) with savings account SA009
(9, 'Jessica', 'Williams', '5-SA001', '445566778'),  -- Customer 9 (Sophia) transfers to Customer 5 (Olivia) with savings account SA001
(3, 'Emma', 'Lopez', '11-CA002', '556677889'),  -- Customer 3 (Emily) transfers to Customer 11 (Olivia) with savings account SA002
(11, 'Emily', 'Brown', '3-CA002', '667788990'),  -- Customer 11 (Olivia) transfers to Customer 3 (Emily) with savings account SA006
(12, 'Olivia', 'Martinez', '9-SA010', '778899001'),  -- Customer 12 (Olivia) transfers to Customer 9 (Sophia) with savings account SA010
(9, 'James', 'Taylor', '12-CA008', '889900112'),  -- Customer 9 (Sophia) transfers to Customer 12 (Olivia) with savings account SA008
-- People registering themselves for initial deposit into their own Current account
(7, 'Sophia', 'Hernandez', '7-CA004','456789'),
(5, 'Jessica', 'Williams', '5-CA006','123456'),
(8, 'Liam', 'Garcia', '8-CA001','987654'),
(9, 'Olivia', 'Martinez', '9-CA005','123456'),
(10, 'Ethan', 'Rodriguez', '10-CA009','654987'),
(11, 'Emma', 'Lopez', '11-CA001','654789'),
(12, 'James', 'Taylor', '12-CA007','123456');

-- Registering self beneficiary for fund transfer in own savings account
INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(4, 'Michael', 'Johnson', '4-SA003', '456789');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(4, 'Michael', 'Johnson', '4-SA004', '6548236');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(5, 'Jessica', 'Williams', '5-SA007', '8787895');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(6, 'Daniel', 'Smith', '6-SA005', '254254');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(7, 'Sophia', 'Hernandez', '7-SA004', '888889');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(8, 'Liam', 'Garcia', '8-SA001', '456789');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(9, 'Olivia', 'Martinez', '9-SA008', '423559');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(9, 'Olivia', 'Martinez', '9-SA009', '423559');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(10, 'Ethan', 'Rodriguez', '10-SA002', '456789');

INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
VALUES
-- People registering themselves for initial deposit into their own Savings account
(12, 'James', 'Taylor', '12-SA008', '456789');

Select * from CustomerSchema.Beneficiary;

-- ===================================================================================================================
-- Step 22) Data Insertion into (V)Current_Account_Transaction_History
-- Step 22A) Below Customers are making intial deposits into their own Current accounts.
INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('7-CA004','Ben-023', '2024-10-01 10:00:00', 'Credit', 1000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('3-CA001','Ben-021', '2023-11-11 10:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('5-CA006','Ben-024', '2022-11-01 10:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('8-CA001','Ben-025', '2022-02-01 11:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('9-CA005','Ben-026', '2024-03-01 01:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('10-CA009','Ben-027', '2024-12-11 10:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('11-CA001','Ben-028', '2024-06-11 09:00:00', 'Credit', 2000, 'Deposit into own account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('12-CA007','Ben-029', '2024-06-15 09:00:00', 'Credit', 2000, 'Deposit into own account');

-- Step 22B) Below customers are making transactions into other beneficiary current accounts
INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('3-CA001','Ben-005', '2024-11-15 09:00:00', 'Debit', 250, 'Deposit into Olivia account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('3-CA001','Ben-001', '2024-11-16 09:00:00', 'Debit', 300, 'Deposit into Daniel account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('5-CA006','Ben-015', '2024-11-17 08:00:00', 'Debit', 330, 'Deposit into Olivia account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('8-CA001','Ben-010', '2024-11-07 08:00:00', 'Debit', 530, 'Deposit into Daniel account');

INSERT INTO CustomerSchema.Current_Transaction_History (CA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('9-CA005','Ben-020', '2024-11-08 09:00:00', 'Debit', 500, 'Deposit into James account');

Select * from CustomerSchema.Current_Transaction_History;

-- ===================================================================================================================
-- Step 23 - Data Insertion into (W)Savings_Account_Transaction_History
-- Step 23A) Below Customers are making intial deposits into their own Savings accounts.
INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
-- Initial deposit to Savings Account 
('4-SA003', 'Ben-031', '2024-06-16 09:00:00', 'Credit', 1000, 'Deposit into own account'),
('4-SA004', 'Ben-032', '2024-06-15 09:00:00', 'Credit', 1000, 'Deposit into own account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
-- Initial deposit to Savings Account 
('5-SA007', 'Ben-033', '2024-07-06 08:00:00', 'Credit', 1000, 'Deposit into own account'),
('6-SA005', 'Ben-034', '2024-08-15 12:00:00', 'Credit', 1000, 'Deposit into own account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('7-SA004', 'Ben-035', '2024-08-15 12:00:00', 'Credit', 1000, 'Deposit into own account'),
('8-SA001', 'Ben-036', '2024-09-25 02:00:00', 'Credit', 1000, 'Deposit into own account'),
('9-SA008', 'Ben-037', '2024-06-05 11:00:00', 'Credit', 1000, 'Deposit into own account'),
('9-SA009', 'Ben-038', '2024-05-10 10:00:00', 'Credit', 1000, 'Deposit into own account'),
('10-SA002', 'Ben-039', '2024-04-06 03:00:00', 'Credit', 1000, 'Deposit into own account'),
('12-SA008', 'Ben-040', '2024-03-03 04:00:00', 'Credit', 1000, 'Deposit into own account');

-- Step 23B) Below customers are making transactions into other beneficiary Savings accounts
INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('4-SA003','Ben-003', '2024-11-08 09:00:00', 'Debit', 500, 'Deposit into Jessica account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('4-SA004','Ben-013', '2024-11-11 08:00:00', 'Debit', 350, 'Deposit into Liam account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('5-SA007','Ben-004', '2024-10-05 05:00:00', 'Debit', 200, 'Deposit into Michael account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('5-SA007','Ben-007', '2024-10-05 05:00:00', 'Debit', 200, 'Deposit into Sophia account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('6-SA005','Ben-002', '2024-10-06 06:00:00', 'Debit', 450, 'Deposit into Emily account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('7-SA004','Ben-008', '2024-11-18 07:00:00', 'Debit', 496, 'Deposit into Jessica account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('8-SA001','Ben-014', '2024-10-30 09:00:00', 'Debit', 120, 'Deposit into Michael account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('9-SA008','Ben-016', '2024-11-01 01:00:00', 'Debit', 658, 'Deposit into Jessica account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('9-SA009','Ben-006', '2024-11-02 03:00:00', 'Debit', 894, 'Deposit into Emily account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('10-SA002','Ben-011', '2024-11-02 04:00:00', 'Debit', 900, 'Deposit into Emma account');

INSERT INTO CustomerSchema.Savings_Transaction_History (SA_Number, Beneficiary_ID, Transaction_Date, Transaction_Type, Amount, Description)
VALUES
('12-SA008','Ben-019', '2024-11-03 05:00:00', 'Debit', 990, 'Deposit into Olivia account');

Select * from CustomerSchema.Savings_Transaction_History;