-- DB creation
CREATE DATABASE BankHub;
USE BankHub;

-- Step 1) Create a custom schema
CREATE SCHEMA BankSchema;
GO

-- ===================================================================================================================
-- Step 2) Custom function for email validation
CREATE FUNCTION BankSchema.ValidateEmail(@Email NVARCHAR(50))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Email LIKE '%@%.%' THEN 1  -- Basic email validation
        ELSE 0
    END
END;
GO

--Step 3) Create Table --> (A)BankSchema.Federal_Govt
CREATE TABLE BankSchema.Federal_Govt (
    Federal_Govt_ID VARCHAR(10) PRIMARY KEY,
    Govt_Name VARCHAR(50) NOT NULL,
    Country_of_Operation VARCHAR(3) CHECK (Country_of_Operation = 'USA'),
    Established_Date DATE NOT NULL,
    End_Date DATE NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(8) CHECK (Status IN ('active', 'inactive')),
    CONSTRAINT CHK_Email_Valid CHECK (BankSchema.ValidateEmail(Email) = 1) -- Table-level CHECK constraint
);
GO

--Step 3A) Data insertion check refer --Step 1)BankHubDataInsertion.sql, Step 01) BankHubTestCases.sql
SELECT * FROM BankSchema.Federal_Govt;

-- ===================================================================================================================
--Step 4) Create Table --> (B)BankSchema.Bank
CREATE TABLE BankSchema.Bank (
    Bank_ID VARCHAR(10) PRIMARY KEY,
    Federal_Govt_ID VARCHAR(10) NOT NULL,
    Bank_Name VARCHAR(20) NOT NULL,
    Bank_Type VARCHAR(10) NOT NULL, 
    Bank_Established_Date DATE,
    Contact_number CHAR(10),
    Email VARCHAR(20),
    Website VARCHAR(20),
    FOREIGN KEY (Federal_Govt_ID) REFERENCES BankSchema.FederalGovt(Federal_Govt_ID),
    CONSTRAINT chk_email_format CHECK (BankSchema.ValidateEmail(Email) = 1),
    CONSTRAINT chk_bank_type CHECK (Bank_Type IN ('Public', 'Private'))
);

--Step 4A) Data insertion check refer --Step 02)BankHubDataInsertion.sql, Step 02) BankHubTestCases.sql
SELECT * FROM BankSchema.Bank;

-- ===================================================================================================================
--Step 5) Create Table --> (C)BankSchema.Current_Account
CREATE TABLE BankSchema.Current_Account (
    Current_Account_ID VARCHAR(50) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL,
    Interest_Rate DECIMAL(10, 2) NOT NULL,   -- Numeric value with 2 decimal places for interest rate
    CONSTRAINT chk_interest_rate CHECK (Interest_Rate >= 0)  -- Ensures the interest rate is non-negative
);

--Step 5A) Data insertion check refer --Step 03)BankHubDataInsertion.sql, Step 03) BankHubTestCases.sql
SELECT * FROM BankSchema.Current_Account;

-- ===================================================================================================================
--Step 6) Create Table --> (D)BankSchema.Loan_Products
CREATE TABLE BankSchema.Loan_Products (
    Loan_Product_ID VARCHAR(50) PRIMARY KEY,
    Loan_Type VARCHAR(100) NOT NULL,
    Interest_Rate DECIMAL(10, 2) NOT NULL,  -- Numeric value with 2 decimal places for interest rate
    CONSTRAINT chk_loan_interest_rate CHECK (Interest_Rate >= 0)  -- Ensures the interest rate is non-negative
);
--Step 6A) Data insertion check refer --Step 04)BankHubDataInsertion.sql, Step 04) BankHubTestCases.sql
SELECT * FROM BankSchema.Loan_Products;

-- ===================================================================================================================
--Step 7) Create Table --> (E)BankSchema.Investment_Option
CREATE TABLE BankSchema.Investment_Option (
    Demat_Account_ID VARCHAR(50) PRIMARY KEY,
    IO_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(50),
    Amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_amount_positive CHECK (Amount >= 0)
);

--Step 7A) Data insertion check refer --Step 05)BankHubDataInsertion.sql, Step 05) BankHubTestCases.sql
SELECT * FROM BankSchema.Investment_Option;

-- ===================================================================================================================
--Step 8) Create Table --> (F)BankSchema.Card
CREATE TABLE BankSchema.Card (
    Card_ID VARCHAR(50) PRIMARY KEY,
    Card_Type VARCHAR(10) NOT NULL,
    Expiration_Date DATE NOT NULL,
    CONSTRAINT chk_card_type CHECK (Card_Type IN ('Debit', 'Credit', 'Forex')), -- Ensures valid card types
    CONSTRAINT chk_expiration_date CHECK (Expiration_Date > GETDATE()) -- Ensures expiration date is in the future
);

--Step 8A) Data insertion check refer --Step 06)BankHubDataInsertion.sql, Step 06) BankHubTestCases.sql
Select * from BankSchema.Card;

-- ===================================================================================================================
-- Step 9) Create Table --> (G)BankSchema.Savings_Account
CREATE TABLE BankSchema.Savings_Account (
    Savings_Account_ID VARCHAR(50) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL,
    Interest_Rate DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_interest_rate_sa CHECK (Interest_Rate >= 0)
);

--Step 9A) Data insertion check refer -- Step 07)BankHubDataInsertion.sql, Step 07) BankHubTestCases.sql
Select * from BankSchema.Savings_Account;

-- ===================================================================================================================
--Step 10) Create a function for validating the Start and End dates for Mapping
CREATE FUNCTION BankSchema.ValidateStartEndDates (
    @StartDate DATE,
    @EndDate DATE
)
RETURNS BIT
AS BEGIN
    -- Declare a variable to hold the return value
    DECLARE @Result BIT;
 
    -- Set the result based on the condition
    IF @EndDate IS NULL OR @StartDate < @EndDate
        SET @Result = 1; -- True
    ELSE
        SET @Result = 0; -- False condition
 
    -- Return the result
    RETURN @Result;
END;

-- Step 11) Create Table --> (H)BankSchema.Bank_Current_Account (Associative Entity)
CREATE TABLE BankSchema.Bank_Current_Account (
    Bank_ID VARCHAR(10),
    Current_Account_ID VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    -- Composite Primary Key
    CONSTRAINT pk_bank_current_account PRIMARY KEY (Bank_ID, Current_Account_ID),
    -- Foreign Key Constraints
    CONSTRAINT fk_bank FOREIGN KEY (Bank_ID) REFERENCES BankSchema.Bank(Bank_ID),
    CONSTRAINT fk_current_account FOREIGN KEY (Current_Account_ID) REFERENCES BankSchema.Current_Account(Current_Account_ID),
    -- Table-level Check Constraint using Function
    CONSTRAINT chk_start_end_date CHECK (BankSchema.ValidateStartEndDates(Start_Date, End_Date) = 1)
);

--Step 11A) Data insertion check refer -- Step 08)BankHubDataInsertion.sql, Step 08) BankHubTestCases.sql
Select * from BankSchema.Bank_Current_Account;

-- ===================================================================================================================
-- Step 12) Create Table --> (I)BankSchema.Bank_Loan_Products (Associative Entity)
CREATE TABLE BankSchema.Bank_Loan_Products (
    Bank_ID VARCHAR(10),
    Loan_Product_ID VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    -- Composite Primary Key
    CONSTRAINT pk_bank_loan_products PRIMARY KEY (Bank_ID, Loan_Product_ID),
    -- Foreign Key Constraints
    CONSTRAINT fk_loan_product_bank FOREIGN KEY (Bank_ID) REFERENCES BankSchema.Bank(Bank_ID),
    CONSTRAINT fk_loan_product_loan FOREIGN KEY (Loan_Product_ID) REFERENCES BankSchema.Loan_Products(Loan_Product_ID),
    -- Table-level Check Constraint using Function
    CONSTRAINT chk_start_end_date_lp CHECK (BankSchema.ValidateStartEndDates(Start_Date, End_Date) = 1))

--Step 12A) Data insertion check refer -- Step 09)BankHubDataInsertion.sql, Step 09) BankHubTestCases.sql
Select * from BankSchema.Bank_Loan_Products;

-- ===================================================================================================================
-- Step 13) Create Table --> (J)BankSchema.Bank_Investment_Option (Associative Entity)
CREATE TABLE BankSchema.Bank_Investment_Option (
    Bank_ID VARCHAR(10),
    Demat_Account_ID VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    -- Composite Primary Key
    CONSTRAINT pk_bank_io PRIMARY KEY (Bank_ID, Demat_Account_ID),
    -- Foreign Key Constraints
    CONSTRAINT fk_io_bank FOREIGN KEY (Bank_ID) REFERENCES BankSchema.Bank(Bank_ID),
    CONSTRAINT fk_io_investment_option FOREIGN KEY (Demat_Account_ID) REFERENCES BankSchema.Investment_Option(Demat_Account_ID),
    -- Table-level Check Constraint using Function
    CONSTRAINT chk_start_end_date_io CHECK (BankSchema.ValidateStartEndDates(Start_Date, End_Date) = 1))

--Step 13A) Data insertion check refer -- Step 10)BankHubDataInsertion.sql, Step 10) BankHubTestCases.sql
Select * from BankSchema.Bank_Investment_Option;

-- ===================================================================================================================
-- Step 14) Create Table --> (K)BankSchema.Bank_Card (Associative Entity)
CREATE TABLE BankSchema.Bank_Card (
    Bank_ID VARCHAR(10),
    Card_ID VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    -- Composite Primary Key
    CONSTRAINT pk_bank_card PRIMARY KEY (Bank_ID, Card_ID),
    -- Foreign Key Constraints
    CONSTRAINT fk_bank_card_bank FOREIGN KEY (Bank_ID) REFERENCES BankSchema.Bank(Bank_ID),
    CONSTRAINT fk_bank_card_card FOREIGN KEY (Card_ID) REFERENCES BankSchema.Card(Card_ID),
    -- Table-level Check Constraint using Function
    CONSTRAINT chk_start_end_date_bc CHECK (BankSchema.ValidateStartEndDates(Start_Date, End_Date) = 1))

--Step 14A) Data insertion check refer -- Step 11)BankHubDataInsertion.sql, Step 11) BankHubTestCases.sql
Select * from BankSchema.Bank_Card;

-- ===================================================================================================================
-- Step 15) Create Table --> (L)BankSchema.Bank_Savings_Account (Associative Entity)
CREATE TABLE BankSchema.Bank_Savings_Account (
    Bank_ID VARCHAR(10),
    Savings_Account_ID VARCHAR(50),
    Start_Date DATE NOT NULL,
    End_Date DATE,
    -- Composite Primary Key
    CONSTRAINT pk_savings_account PRIMARY KEY (Bank_ID, Savings_Account_ID),
    -- Foreign Key Constraints
    CONSTRAINT fk_savings_account_bank FOREIGN KEY (Bank_ID) REFERENCES BankSchema.Bank(Bank_ID),
    CONSTRAINT fk_savings_account_sa FOREIGN KEY (Savings_Account_ID) REFERENCES BankSchema.Savings_Account(Savings_Account_ID),
    -- Table-level Check Constraint using Function
    CONSTRAINT chk_start_end_date_sa CHECK (BankSchema.ValidateStartEndDates(Start_Date, End_Date) = 1))

--Step 15A) Data insertion check refer -- Step 12)BankHubDataInsertion.sql, Step 12) BankHubTestCases.sql
Select * from BankSchema.Bank_Savings_Account;

-- ===================================================================================================================
-- Step 16): Create the schema for Customer
CREATE SCHEMA CustomerSchema;
GO

-- ===================================================================================================================
-- Step 17) Create Table --> (M)CustomerSchema.Customer
CREATE TABLE CustomerSchema.Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,       -- Auto-incrementing primary key
    Cust_FName VARCHAR(50) NOT NULL,               -- First name (Unicode support)
    Cust_LName VARCHAR(50) NOT NULL,               -- Last name (Unicode support)
    Cust_DOB DATE NOT NULL,                         -- Date of Birth
    Cust_email NVARCHAR(50) NOT NULL UNIQUE,        --
	Cust_contact CHAR(10) NOT NULL,                 -- 10-digit phone number
    Address_line_1 VARCHAR(100) NOT NULL,          -- Address line 1 (Unicode support)
    Address_line_2 VARCHAR(100) NULL,              -- Optional address line 2
    City VARCHAR(50) NOT NULL,                     -- City (Unicode support)
    Zip CHAR(5) NOT NULL,                           -- 5-digit ZIP code
    Credit_score INT NULL
);

-- Step 17A): Create functions for Customer Validations
-- Function to validate first name and last name (no numbers, special characters)
CREATE FUNCTION CustomerSchema.ValidateName(@Name NVARCHAR(50))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Name LIKE '%[^a-zA-Z ]%' THEN 0  -- Invalid if it contains non-alphabetic characters
        ELSE 1
    END
END;
GO

-- Function to validate date of birth (should not be a future date)
CREATE FUNCTION CustomerSchema.ValidateDOB(@DOB DATE)
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @DOB >= GETDATE() THEN 0  -- Invalid if DOB is in the future
        ELSE 1
    END
END;
GO

-- Function to validate Zip Code
CREATE FUNCTION CustomerSchema.ValidateZip(@Zip NVARCHAR(5))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN ISNUMERIC(@Zip) = 1 AND LEN(@Zip) = 5 THEN 1
        ELSE 0
    END
END;
GO

-- Function to validate phone number (10 digits only)
CREATE FUNCTION CustomerSchema.ValidatePhoneNumber(@PhoneNumber NVARCHAR(10))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN ISNUMERIC(@PhoneNumber) = 1 AND LEN(@PhoneNumber) = 10 THEN 1
        ELSE 0
    END
END;
GO

-- Function to validate address (line 1 and line 2) to ensure it's not empty or too short
CREATE FUNCTION CustomerSchema.ValidateAddress(@Address NVARCHAR(100))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN LEN(LTRIM(RTRIM(@Address))) < 5 THEN 0 -- Invalid if address is too short
        ELSE 1
    END
END;
GO

-- Function to validate city (alphabetic characters only)
CREATE FUNCTION CustomerSchema.ValidateCity(@City NVARCHAR(50))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @City LIKE '%[^a-zA-Z ]%' THEN 0  -- Invalid if it contains non-alphabetic characters
        ELSE 1
    END
END;
GO

-- Step 17B): Create Trigger for Customer Table
CREATE TRIGGER CustomerSchema.ValidateCustomersData
ON CustomerSchema.Customer
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(255);

    -- Validate first name
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateName(Cust_FName) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Cust_FName contains invalid characters.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate last name
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateName(Cust_LName) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Cust_LName contains invalid characters.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate date of birth
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateDOB(Cust_DOB) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Cust_DOB must not be in the future.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate email (reuse a function or manually check format if needed)
    IF EXISTS (
        SELECT 1 FROM inserted WHERE BankSchema.ValidateEmail(Cust_email) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Cust_email is not in a valid format.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate phone number
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidatePhoneNumber(Cust_contact) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Cust_contact must be a 10-digit number.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate address line 1
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateAddress(Address_line_1) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Address_line_1 must be at least 5 characters long.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate city
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateCity(City) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: City contains invalid characters.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- Validate ZIP code
    IF EXISTS (
        SELECT 1 FROM inserted WHERE CustomerSchema.ValidateZip(Zip) = 0
    )
    BEGIN
        SET @ErrorMessage = 'Validation failed: Zip must be a 5-digit number.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END;

    -- If all validations pass, perform the insert or update
    INSERT INTO CustomerSchema.Customer (Cust_FName, Cust_LName, Cust_DOB, Cust_email, Cust_contact, Address_line_1, Address_line_2, City, Zip)
    SELECT Cust_FName, Cust_LName, Cust_DOB, Cust_email, Cust_contact, Address_line_1, Address_line_2, City, Zip
    FROM inserted;
END;
GO

--Step 17C)Create Trigger to Assign Random Credit Score
CREATE TRIGGER trg_AutoAssignCreditScore
ON CustomerSchema.Customer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update Credit_score with a random value between 300 and 850
    UPDATE CustomerSchema.Customer
    SET Credit_score = FLOOR(RAND(CHECKSUM(NEWID())) * (850 - 300 + 1)) + 300
    WHERE Customer_ID IN (SELECT Customer_ID FROM inserted);
END;
GO

--Step 17D) Data insertion check refer -- Step 13)BankHubDataInsertion.sql, Step 13) BankHubTestCases.sql
Select * from CustomerSchema.Customer;

-- ===================================================================================================================
-- Step 18) Create Mapping table (N)CustomerSchema.Customer_Bank
CREATE TABLE CustomerSchema.Customer_Bank (
    Bank_ID VARCHAR(10),                         -- Foreign Key referencing Bank table
    Customer_ID INT,                             -- Foreign Key referencing Customer table
    
    -- Composite Primary Key
    CONSTRAINT pk_customer_bank PRIMARY KEY (Bank_ID, Customer_ID),
    
    -- Foreign Key Constraints
    CONSTRAINT fk_customer_bank_bank FOREIGN KEY (Bank_ID) 
        REFERENCES BankSchema.Bank (Bank_ID),
    
    CONSTRAINT fk_customer_bank_customer FOREIGN KEY (Customer_ID) 
        REFERENCES CustomerSchema.Customer (Customer_ID)
);

-- Step 18A) Data insertion check refer -- Step 14)BankHubDataInsertion.sql, Step 14) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Bank;

-- ===================================================================================================================
-- Step 19)Functions for Security log
-- Step A: Create custom functions for validations for the Security_Log table

-- Function to validate Activity Type (ensure it is not null or empty)
CREATE FUNCTION CustomerSchema.ValidateActivityType(@ActivityType NVARCHAR(20))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN LEN(LTRIM(RTRIM(@ActivityType))) = 0 THEN 0 -- Invalid if empty
        ELSE 1
    END
END;
GO

-- Function to validate IP Address (basic validation for presence of digits and periods)
CREATE FUNCTION CustomerSchema.ValidateIPAddress(@IPAddress NVARCHAR(50))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @IPAddress LIKE '%[^0-9.]%' OR LEN(LTRIM(RTRIM(@IPAddress))) < 7 THEN 0 -- Invalid if it contains invalid characters or is too short
        ELSE 1
    END
END;
GO

-- Function to validate Device Info (ensure it is not null or empty)
CREATE FUNCTION CustomerSchema.ValidateDeviceInfo(@DeviceInfo NVARCHAR(20))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN LEN(LTRIM(RTRIM(@DeviceInfo))) = 0 THEN 0 -- Invalid if empty
        ELSE 1
    END
END;
GO

-- Step 20) Create table (O)CustomerSchema.Security Log
CREATE TABLE CustomerSchema.Security_Log (
    LogID CHAR(36) PRIMARY KEY DEFAULT NEWID(), 
    Customer_ID INT NOT NULL,
    Activity_Type NVARCHAR(20) NOT NULL,
    Timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    IPAddress NVARCHAR(50) NOT NULL,
    Device_Info NVARCHAR(20) NOT NULL,
    -- Foreign Key Constraint
    CONSTRAINT FK_Customer_SecurityLog FOREIGN KEY (Customer_ID) REFERENCES CustomerSchema.Customer (Customer_ID),
    -- CHECK Constraints using the custom functions
    CONSTRAINT CHK_ActivityType_Valid CHECK (CustomerSchema.ValidateActivityType(Activity_Type) = 1),
    CONSTRAINT CHK_IPAddress_Valid CHECK (CustomerSchema.ValidateIPAddress(IPAddress) = 1),
    CONSTRAINT CHK_DeviceInfo_Valid CHECK (CustomerSchema.ValidateDeviceInfo(Device_Info) = 1)
);
--Backup the Original Data
SELECT LogID, CAST(IPAddress AS NVARCHAR(250)) AS IPAddress
INTO Temp_Security_Log_Backup
FROM CustomerSchema.Security_Log;

-- Create Certificate
CREATE CERTIFICATE SecurityCert
WITH SUBJECT = 'Encryption for Security Log Data';
-- Create Master Key
CREATE SYMMETRIC KEY SecurityKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE SecurityCert;
--Create Symmetric Key
CREATE SYMMETRIC KEY SecurityKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE SecurityCert;
--Dropping the Original Column
ALTER TABLE CustomerSchema.Security_Log
DROP COLUMN IPAddress;

--Encrypt Data in Temporary Column
OPEN SYMMETRIC KEY SecurityKey
DECRYPTION BY CERTIFICATE SecurityCert;

UPDATE CustomerSchema.Security_Log
SET Temp_IPAddress = EncryptByKey(Key_GUID('SecurityKey'), CONVERT(NVARCHAR(MAX), B.IPAddress))
FROM CustomerSchema.Security_Log AS SL
JOIN Temp_Security_Log_Backup AS B
ON SL.LogID = B.LogID;

CLOSE SYMMETRIC KEY SecurityKey;
--Rename the Temporary Column
EXEC sp_rename 'CustomerSchema.Security_Log.Temp_IPAddress', 'IPAddress', 'COLUMN';

OPEN SYMMETRIC KEY SecurityKey
DECRYPTION BY CERTIFICATE SecurityCert;

SELECT LogID, Customer_ID,
       CAST(DecryptByKey(IPAddress) AS NVARCHAR(MAX)) AS Decrypted_IPAddress
FROM CustomerSchema.Security_Log;

CLOSE SYMMETRIC KEY SecurityKey;
-- Add Constraint to Validate IPAddress
ALTER TABLE CustomerSchema.Security_Log
ADD CONSTRAINT CHK_IPAddress_Valid
CHECK (CustomerSchema.ValidateIPAddress(CAST(DecryptByKey(IPAddress) AS NVARCHAR(MAX))) = 1);

--Step 20A) Data insertion check refer -- Step 15)BankHubDataInsertion.sql, Step 15) BankHubTestCases.sql
Select * from CustomerSchema.Security_Log;

-- ===================================================================================================================
-- Step 21) Create Table (P)CustomerSchema.Beneficiary
CREATE TABLE CustomerSchema.Beneficiary (
    Customer_ID INT,
	Beneficiary_ID VARCHAR(20) PRIMARY KEY,
    Beneficiary_FName VARCHAR(50) NOT NULL,
    Beneficiary_LName VARCHAR(50) NOT NULL,
    Account_number VARCHAR(10),
    Routing_Number VARCHAR(50) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES CustomerSchema.Customer(Customer_ID)
);

--Step 21A) Data insertion check refer -- Step 21)BankHubDataInsertion.sql, Step 21) BankHubTestCases.sql
Select * from CustomerSchema.Beneficiary;

-- Step 22) Create Trigger for auto-generating Beneficiary_ID
CREATE TRIGGER trg_BeneficiaryID_AutoGenerate
ON CustomerSchema.Beneficiary
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaxID INT;
    DECLARE @NewBeneficiaryID VARCHAR(20);

    -- Get the highest numerical part of the Beneficiary_ID and increment it
    SELECT @MaxID = MAX(CAST(SUBSTRING(Beneficiary_ID, 5, LEN(Beneficiary_ID)) AS INT))
    FROM CustomerSchema.Beneficiary;

    -- If no data exists, start from 1, else increment the existing max ID
    IF @MaxID IS NULL
    BEGIN
        SET @MaxID = 1;
    END
    ELSE
    BEGIN
        SET @MaxID = @MaxID + 1;
    END

    -- Generate the new Beneficiary_ID in the format 'Ben-001', 'Ben-002', etc.
    SET @NewBeneficiaryID = 'Ben-' + RIGHT('000' + CAST(@MaxID AS VARCHAR(3)), 3);

    -- Ensure the new Beneficiary_ID is unique
    WHILE EXISTS (SELECT 1 FROM CustomerSchema.Beneficiary WHERE Beneficiary_ID = @NewBeneficiaryID)
    BEGIN
        SET @MaxID = @MaxID + 1;
        SET @NewBeneficiaryID = 'Ben-' + RIGHT('000' + CAST(@MaxID AS VARCHAR(3)), 3);
    END

    -- Insert the new record with the generated Beneficiary_ID in the format 'Ben-001'
    INSERT INTO CustomerSchema.Beneficiary (Customer_ID, Beneficiary_ID, Beneficiary_FName, Beneficiary_LName, Account_number, Routing_Number)
    SELECT 
        Customer_ID, 
        @NewBeneficiaryID, 
        Beneficiary_FName, 
        Beneficiary_LName, 
        Account_number, 
        Routing_Number
    FROM inserted;
END;

-- ===================================================================================================================
-- Step 23) Create Mapping Table (Q) CustomerSchema.Customer_Current_Account
CREATE TABLE CustomerSchema.Customer_Current_Account (
    CA_Number VARCHAR(10) PRIMARY KEY,        -- Unique identifier for this entry
    Customer_ID INT NOT NULL,                  -- Foreign Key referencing Customer table
    Current_Account_ID VARCHAR(50) NOT NULL,   -- Foreign Key referencing Current_Account table

    -- Composite Foreign Key Constraints
    CONSTRAINT FK_Customer_Current_Account_Customer FOREIGN KEY (Customer_ID) 
        REFERENCES CustomerSchema.Customer (Customer_ID),

    CONSTRAINT FK_Customer_Current_Account_Current_Account FOREIGN KEY (Current_Account_ID) 
        REFERENCES BankSchema.Current_Account (Current_Account_ID),

    -- Composite Unique Constraint to ensure unique pairing of Customer_ID and Current_Account_ID
    CONSTRAINT uq_customer_current_account UNIQUE (Customer_ID, Current_Account_ID)
);

--Step 23A) Data insertion check refer -- Step 16)BankHubDataInsertion.sql, Step 16) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Current_Account;

-- Step 24) Trigger for autogenerating the CA_Number in CustomerSchema.Customer_Current_Account 
CREATE TRIGGER trg_AutoGenerateCA_Number
ON CustomerSchema.Customer_Current_Account
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert rows with auto-generated CA_Number
    INSERT INTO CustomerSchema.Customer_Current_Account (CA_Number, Customer_ID, Current_Account_ID)
    SELECT 
        -- Generate CA_Number using Customer_ID and Current_Account_ID directly
        CONCAT(CAST(Customer_ID AS VARCHAR), '-', Current_Account_ID) AS CA_Number,
        Customer_ID,
        Current_Account_ID
    FROM inserted
    WHERE NOT EXISTS (
        SELECT 1 
        FROM CustomerSchema.Customer_Current_Account 
        WHERE Customer_ID = inserted.Customer_ID 
          AND Current_Account_ID = inserted.Current_Account_ID
    );
END;
GO

-- ===================================================================================================================
-- Step 25) Create Mapping Table (R) CustomerSchema.Customer_Loan (Associative table)
-- Step 25A) Function for Validating CustomerSchema.Customer_Loan table.
CREATE FUNCTION CustomerSchema.ValidateLoanStatus(@LoanStatus NVARCHAR(20))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @LoanStatus IN ('In-Progress', 'Completed', 'Defaulted') THEN 1
        ELSE 0
    END
END;
GO

-- validateAmount:
-- Ensures Loan_Amount is greater than 0.

CREATE FUNCTION CustomerSchema.ValidateAmount(@Amount DECIMAL(10, 2))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Amount > 0 THEN 1
        ELSE 0
    END
END;
GO


-- ValidateTenure:
-- Ensures Tenure (in months) is greater than 0.
CREATE FUNCTION CustomerSchema.ValidateTenure(@Tenure INT)
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Tenure > 0 THEN 1
        ELSE 0
    END
END;
GO

-- Step 25B) Creating CustomerSchema.Customer_Loan table
CREATE TABLE CustomerSchema.Customer_Loan (
    Loan_Product_ID VARCHAR(50) NOT NULL,
    Customer_ID INT NOT NULL,
    Loan_Acc_Number VARCHAR(10) NOT NULL,
    Application_Date DATE NOT NULL,
    Loan_Status VARCHAR(20) NOT NULL,
    Loan_Amount DECIMAL(10, 2) NOT NULL,
    Tenure INT NOT NULL, -- In months
    
    -- Composite Primary Key
    CONSTRAINT PK_CustomerLoan PRIMARY KEY (Loan_Product_ID, Customer_ID, Loan_Acc_Number),
    
    -- Foreign Key Constraints
    CONSTRAINT FK_CustomerLoan_LoanProduct FOREIGN KEY (Loan_Product_ID) REFERENCES BankSchema.Loan_Products (Loan_Product_ID),
    CONSTRAINT FK_CustomerLoan_Customer FOREIGN KEY (Customer_ID) REFERENCES CustomerSchema.Customer (Customer_ID),
   
    -- Table-level CHECK Constraints
    CONSTRAINT CHK_LoanStatus_Valid CHECK (CustomerSchema.ValidateLoanStatus(Loan_Status) = 1),
    CONSTRAINT CHK_LoanAmount_Valid CHECK (CustomerSchema.ValidateAmount(Loan_Amount) = 1),
    CONSTRAINT CHK_Tenure_Valid CHECK (CustomerSchema.ValidateTenure(Tenure) = 1)
);


--Step 25C) Data insertion check refer -- Step 18)BankHubDataInsertion.sql, Step 18) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Loan;

-- ===================================================================================================================
-- Step 26) Create Mapping Table (S) CustomerSchema.Customer_Investment (Associative table)
CREATE TABLE BankHub.CustomerSchema.Customer_Investment (
    Customer_ID INT NOT NULL,
    Demat_Account_ID VARCHAR(50) NOT NULL,
    Demat_Account_Number VARCHAR(10) NOT NULL,
    Type_of_Investment VARCHAR(30) NULL,
    Portfolio_Value DECIMAL(10, 2) NULL,
    CONSTRAINT pk_customer_investment PRIMARY KEY (Customer_ID, Demat_Account_ID, Demat_Account_Number),
    CONSTRAINT fk_ci_customer FOREIGN KEY (Customer_ID) REFERENCES BankHub.CustomerSchema.Customer(Customer_ID),
    CONSTRAINT fk_ci_io FOREIGN KEY (Demat_Account_ID) REFERENCES BankHub.BankSchema.Investment_Option(Demat_Account_ID),
	CONSTRAINT chk_portfolio_value CHECK ([Portfolio_Value] >= 0)
);

--Step 26A) Data insertion check refer -- Step 19)BankHubDataInsertion.sql, Step 19) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Investment;

-- ===================================================================================================================
-- Step 27) Create Mapping Table (T) CustomerSchema.Customer_Cards; (Associative table)
CREATE TABLE CustomerSchema.Customer_Cards (
    Card_ID VARCHAR(50) NOT NULL, -- Foreign Key referencing Card table
    Customer_ID INT NOT NULL, -- Foreign Key referencing Customer table
    Card_Number VARCHAR(16) NOT NULL, -- Unique identifier for the customer's card
    Card_Exp_Date DATE NOT NULL, -- Expiration date of the card
    Card_Status VARCHAR(10) NOT NULL, -- Status of the card application
    Limit DECIMAL(10,2) NOT NULL, -- Credit/debit limit of the card

    -- Composite Unique Primary Key
    CONSTRAINT pk_customer_cards PRIMARY KEY (Card_ID, Customer_ID, Card_Number),
    
    -- Foreign Key Constraints
    CONSTRAINT fk_customer_cards_card FOREIGN KEY (Card_ID) REFERENCES BankSchema.Card (Card_ID),
    CONSTRAINT fk_customer_cards_customer FOREIGN KEY (Customer_ID) REFERENCES CustomerSchema.Customer (Customer_ID),

    -- Check Constraint
    CONSTRAINT chk_card_status CHECK (Card_Status IN ('Active', 'Inactive'))
);

--Step 27A) Data insertion check refer -- Step 20)BankHubDataInsertion.sql, Step 20) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Cards;

-- ===================================================================================================================
-- Step 28) Create Mapping Table (U)CustomerSchema.Customer_Savings_Account
CREATE TABLE CustomerSchema.Customer_Savings_Account (
    SA_Number VARCHAR(10) PRIMARY KEY,        -- Unique identifier for this entry
    Customer_ID INT NOT NULL,                  -- Foreign Key referencing Customer table
    Savings_Account_ID VARCHAR(50) NOT NULL,   -- Foreign Key referencing Current_Account table

    -- Composite Foreign Key Constraints
    CONSTRAINT FK_Customer_Savings_Account_Customer FOREIGN KEY (Customer_ID) 
        REFERENCES CustomerSchema.Customer (Customer_ID),

    CONSTRAINT FK_Customer_Savings_Account_Savings_Account FOREIGN KEY (Savings_Account_ID) 
        REFERENCES BankSchema.Savings_Account(Savings_Account_ID),

    -- Composite Unique Constraint to ensure unique pairing of Customer_ID and Savings_Account_ID
    CONSTRAINT uq_customer_savings_account UNIQUE (Customer_ID, Savings_Account_ID)
);

--Step 28A) Data insertion check refer -- Step 17)BankHubDataInsertion.sql, Step 17) BankHubTestCases.sql
Select * from CustomerSchema.Customer_Savings_Account;

-- Step 29) Trigger for autogenerating the SA_Number in CustomerSchema.Customer_Savings_Account
CREATE TRIGGER trg_AutoGenerateSA_Number
ON CustomerSchema.Customer_Savings_Account
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert rows with auto-generated SA_Number
    INSERT INTO CustomerSchema.Customer_Savings_Account (SA_Number, Customer_ID, Savings_Account_ID)
    SELECT 
        -- Generate SA_Number using Customer_ID and Savings_Account_ID
        CONCAT(CAST(Customer_ID AS VARCHAR), '-', Savings_Account_ID) AS SA_Number,
        Customer_ID,
        Savings_Account_ID
    FROM inserted
    WHERE NOT EXISTS (
        SELECT 1 
        FROM CustomerSchema.Customer_Savings_Account 
        WHERE Customer_ID = inserted.Customer_ID 
          AND Savings_Account_ID = inserted.Savings_Account_ID
    );
END;
GO

-- ===================================================================================================================
-- Step 30) Create Function for (V)CustomerSchema.Current_Transaction_History and (W)CustomerSchema.Savings_Transaction_History 
-- Function to validate Transaction Type (should be either "Credit" or "Debit")
CREATE FUNCTION CustomerSchema.ValidateTransactionType(@TransactionType NVARCHAR(10))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @TransactionType IN ('Credit', 'Debit') THEN 1
        ELSE 0
    END
END;
GO

-- Function to validate Amount (should be greater than 0)
CREATE FUNCTION CustomerSchema.ValidateAmount(@Amount DECIMAL(10, 2))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Amount > 0 THEN 1
        ELSE 0
    END
END;
GO

-- Function to validate Balance After Transaction (should be >= 0)
CREATE FUNCTION CustomerSchema.ValidateBalance(@Balance DECIMAL(10, 2))
RETURNS BIT
AS
BEGIN
    RETURN CASE
        WHEN @Balance >= 0 THEN 1
        ELSE 0
    END
END;
GO

-- ===================================================================================================================
--Step 31) Create (V)CustomerSchema.Current_Transaction_History Table on Customer_Current_Account
CREATE TABLE CustomerSchema.Current_Transaction_History (
    Transaction_ID INT PRIMARY KEY IDENTITY(1,1),
    CA_Number VARCHAR(10) NOT NULL,  -- Foreign Key referencing Customer_Current_Account
    Beneficiary_ID VARCHAR(20) NOT NULL,
    Transaction_Date DATETIME NOT NULL,
    Transaction_Type VARCHAR(10) NOT NULL CHECK (Transaction_Type IN ('Credit', 'Debit')),  -- Replacing ENUM with VARCHAR and CHECK constraint
    Amount DECIMAL(10,2) NOT NULL,
    Balance_After_Transaction DECIMAL(10,2) NULL,
    Description VARCHAR(100),
    
    -- Foreign Key Constraints
    FOREIGN KEY (CA_Number) REFERENCES CustomerSchema.Customer_Current_Account (CA_Number),
    FOREIGN KEY (Beneficiary_ID) REFERENCES CustomerSchema.Beneficiary (Beneficiary_ID)
);

--Step 31A) Data insertion check refer -- Step 22)BankHubDataInsertion.sql, Step 22) BankHubTestCases.sql
Select * from CustomerSchema.Current_Transaction_History;

--Step 32) Trigger for Updating Balance after each transaction on CustomerSchema.Current_Transaction_History Table
CREATE TRIGGER trg_Update_Balance
ON CustomerSchema.Current_Transaction_History
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    -- Update the balance for the latest transaction
    WITH LatestBalances AS (
        SELECT
            I.Transaction_ID,
            I.CA_Number,
            I.Transaction_Type,
            I.Amount,
            ISNULL(
                (
                    SELECT TOP 1 Balance_After_Transaction
                    FROM CustomerSchema.Current_Transaction_History
                    WHERE CA_Number = I.CA_Number
                    AND Transaction_ID < I.Transaction_ID
                    ORDER BY Transaction_ID DESC
                ),
                0
            ) AS Previous_Balance
        FROM
            INSERTED I
    )
    UPDATE CTH
    SET 
        Balance_After_Transaction = 
            CASE
                WHEN LB.Transaction_Type = 'Credit' THEN LB.Previous_Balance + LB.Amount
                WHEN LB.Transaction_Type = 'Debit' THEN LB.Previous_Balance - LB.Amount
            END
    FROM 
        CustomerSchema.Current_Transaction_History AS CTH
    INNER JOIN
        LatestBalances AS LB
    ON 
        CTH.Transaction_ID = LB.Transaction_ID;

    -- Check if any balance went negative
    IF EXISTS (
        SELECT 1
        FROM CustomerSchema.Current_Transaction_History
        WHERE Balance_After_Transaction < 0
    )
    BEGIN
        RAISERROR('Insufficient funds and Balance cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- ===================================================================================================================
-- Step 33) Create (W)Savings_Account_Transaction_History table on Customer_Savings_Account
CREATE TABLE CustomerSchema.Savings_Transaction_History (
    Transaction_ID INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment primary key
    SA_Number VARCHAR(10) NOT NULL,              -- Foreign Key referencing Customer_Savings_Account
    Beneficiary_ID VARCHAR(20) NOT NULL,         -- Foreign Key referencing Beneficiary
    Transaction_Date DATETIME NOT NULL,          -- Changed to DATETIME to match `Current_Transaction_History`
    Transaction_Type VARCHAR(10) NOT NULL CHECK (Transaction_Type IN ('Credit', 'Debit')),  -- CHECK constraint for transaction type
    Amount DECIMAL(10,2) NOT NULL,               -- Amount cannot be null
    Balance_After_Transaction DECIMAL(10,2) NULL,
    Description VARCHAR(100),                    -- Optional field for additional information
    
    -- Foreign Key Constraints
    FOREIGN KEY (SA_Number) REFERENCES CustomerSchema.Customer_Savings_Account (SA_Number),
    FOREIGN KEY (Beneficiary_ID) REFERENCES CustomerSchema.Beneficiary (Beneficiary_ID)
);

--Step 33A) Data insertion check refer -- Step 23)BankHubDataInsertion.sql, Step 23) BankHubTestCases.sql
Select * from CustomerSchema.Savings_Transaction_History;

--Step 34) Trigger for Updating Balance after each transaction on CustomerSchema.Savings_Transaction_History Table
CREATE TRIGGER trg_Update_Balance_Savings
ON CustomerSchema.Savings_Transaction_History
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the balance for the latest transaction
    WITH LatestBalances AS (
        SELECT
            I.Transaction_ID,
            I.SA_Number,
            I.Transaction_Type,
            I.Amount,
            ISNULL(
                (
                    SELECT TOP 1 Balance_After_Transaction
                    FROM CustomerSchema.Savings_Transaction_History
                    WHERE SA_Number = I.SA_Number
                    AND Transaction_ID < I.Transaction_ID
                    ORDER BY Transaction_ID DESC
                ),
                0
            ) AS Previous_Balance
        FROM
            INSERTED I
    )
    UPDATE STH
    SET 
        Balance_After_Transaction = 
            CASE
                WHEN LB.Transaction_Type = 'Credit' THEN LB.Previous_Balance + LB.Amount
                WHEN LB.Transaction_Type = 'Debit' THEN LB.Previous_Balance - LB.Amount
            END
    FROM 
        CustomerSchema.Savings_Transaction_History AS STH
    INNER JOIN
        LatestBalances AS LB
    ON 
        STH.Transaction_ID = LB.Transaction_ID;

    -- Check if any balance went negative
    IF EXISTS (
        SELECT 1
        FROM CustomerSchema.Savings_Transaction_History
        WHERE Balance_After_Transaction < 0
    )
    BEGIN
        RAISERROR('Insufficient funds and Balance cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- =====================================================================================================
-- Step 35) Views Creation
--Views For BankHub based on functions 
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1) Monthly Average Credit
-- This view calculates the monthly average of credit transactions for each current account 
CREATE VIEW CustomerSchema.VW_Monthly_Avg_Credit AS
SELECT 
    t.CA_Number,
    FORMAT(t.Transaction_Date, 'yyyy-MM') AS Transaction_Month,
    AVG(t.Amount) AS Average_Credit
FROM 
    CustomerSchema.Current_Transaction_History t
WHERE 
    t.Transaction_Type = 'Credit'
GROUP BY 
    t.CA_Number, FORMAT(t.Transaction_Date, 'yyyy-MM');

SELECT * FROM CustomerSchema.VW_Monthly_Avg_Credit;

-- 2) Monthly Average Debit
-- This view calculates the monthly average of credit transactions for each current account 
CREATE VIEW CustomerSchema.VW_Monthly_Avg_Debit AS
SELECT 
    t.CA_Number,
    FORMAT(t.Transaction_Date, 'yyyy-MM') AS Transaction_Month,
    AVG(t.Amount) AS Avg_Debit
FROM 
    CustomerSchema.Current_Transaction_History t
WHERE 
    t.Transaction_Type = 'Debit'
GROUP BY 
    t.CA_Number, FORMAT(t.Transaction_Date, 'yyyy-MM');

SELECT * FROM CustomerSchema.VW_Monthly_Avg_Debit;

-- 3)Current Transaction History View
-- This view provides a detailed history of all transactions, including account and beneficiary details.

CREATE VIEW CustomerSchema.VW_Current_Transaction_History AS
SELECT 
    t.Transaction_ID,
    t.CA_Number,
    t.Beneficiary_ID,
    b.Beneficiary_FName,
    b.Beneficiary_LName,
    t.Transaction_Date,
    t.Transaction_Type,
    t.Amount,
    t.Balance_After_Transaction,
    t.Description
FROM 
    CustomerSchema.Current_Transaction_History t
LEFT JOIN CustomerSchema.Beneficiary b 
    ON t.Beneficiary_ID = b.Beneficiary_ID;

select * from CustomerSchema.VW_Current_Transaction_History;

--4) Customer Transactions for Checking account:- This procedure allows you to input a Customer_ID and retrieve all transactions for their checking accounts.
CREATE PROCEDURE CustomerSchema.sp_GetCustomerTransactions
    @CustomerID INT
AS
BEGIN
    SELECT 
        t.Transaction_ID,
        t.CA_Number,
        t.Beneficiary_ID,
        b.Beneficiary_FName,
        b.Beneficiary_LName,
        t.Transaction_Date,
        t.Transaction_Type,
        t.Amount,
        t.Balance_After_Transaction,
        t.Description
    FROM 
        CustomerSchema.Current_Transaction_History t
    INNER JOIN CustomerSchema.Customer_Current_Account ca 
        ON t.CA_Number = ca.CA_Number
    LEFT JOIN CustomerSchema.Beneficiary b 
        ON t.Beneficiary_ID = b.Beneficiary_ID
    WHERE 
        ca.Customer_ID = @CustomerID;
END;

EXEC CustomerSchema.sp_GetCustomerTransactions @CustomerID = 5;

-- 4) Stored Procedure for Savings Account Transactions
CREATE PROCEDURE CustomerSchema.sp_GetSavingsTransactions
    @CustomerID INT
AS
BEGIN
    SELECT 
        t.Transaction_ID,
        t.SA_Number,
        t.Beneficiary_ID,
        b.Beneficiary_FName,
        b.Beneficiary_LName,
        t.Transaction_Date,
        t.Transaction_Type,
        t.Amount,
        t.Balance_After_Transaction,
        t.Description
    FROM 
        CustomerSchema.Savings_Transaction_History t
    INNER JOIN CustomerSchema.Customer_Savings_Account sa 
        ON t.SA_Number = sa.SA_Number
    LEFT JOIN CustomerSchema.Beneficiary b 
        ON t.Beneficiary_ID = b.Beneficiary_ID
    WHERE 
        sa.Customer_ID = @CustomerID;
END;

EXEC CustomerSchema.sp_GetSavingsTransactions @CustomerID = 4;
