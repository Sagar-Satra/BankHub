# BankHub (Centralized Banking Database System)

## Purpose of the Database

The Centralized Banking Database System is designed to enhance the banking experience by providing users with a unified platform to view and manage multiple bank accounts and subscribed products across various banks.

---

## Business Problems Addressed

1. **Centralized Access**  
   - Create a relational database system that consolidates account and financial information for customers, accessible from a single platform.

2. **Improved User Experience**  
   - Simplify access to account details, compliance updates, and banking product offerings.

3. **Data Processing and Access**  
   - Process account balances based on transaction history while ensuring secure data access through privilege settings.

4. **Empowering Financial Decisions**  
   - Enable users to manage subscriptions, monitor spending, compare products, and make informed investment decisions using data-driven insights and strategies.

---

## Business Rules

1. **Customer Management**  
   - Customers can have multiple bank accounts across different banks.  
   - Each account is associated with only one customer.

2. **Beneficiary Relationship**  
   - Customers can link multiple beneficiaries to their accounts.

3. **Banking System**  
   - Each bank offers multiple products categorized as:  
     - Loans  
     - Bank cards  
     - Investments  
     - Current accounts  
     - Savings accounts  

4. **Products**  
   - A product can be subscribed to by multiple customers.  
   - Customers can subscribe to multiple products.

5. **Transactions**  
   - Transactions are linked to specific customer accounts and beneficiaries.  
   - Each transaction includes the following details:  
     - Transaction ID  
     - Customer account number  
     - Beneficiary ID  
     - Transaction date  
     - Transaction type  
     - Transferred amount  
     - Remaining balance  
     - Description provided by the customer  

6. **Compliance and Regulation**  
   - Banks must comply with federal government regulations.  
   - Compliance roles are assigned and monitored by the federal government.

---

## Features

- Centralized access to multiple accounts and banking products.  
- Real-time transaction tracking with detailed information.  
- Subscription management for financial products.  
- Financial insights to aid investment and spending decisions.  
- Secure access with role-based data privileges.

## Setup

 - Download SQL Server Management Studio
 - Follow the instructions in the implementation files step by step to set the database and its data
 - Using various data setup instructions you can test the functionality of the database.

## Warning

This project is intended for learning and personal use only. Using this project for academic purposes without proper attribution may lead to plagiarism, which is a violation of academic integrity policies.

## License

This project is licensed under the [MIT License](LICENSE).

---
