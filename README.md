\# Functional Payment Transaction Processor



A beginner-friendly command-line project built with Haskell to demonstrate functional programming concepts through simulated payment transaction processing.



\## Features



\- Validates that transaction amounts are positive.

\- Checks whether the available balance is sufficient.

\- Processes transactions sequentially.

\- Updates the balance after successful payments.

\- Handles invalid amounts and insufficient-balance failures.

\- Uses immutable data, pure functions, pattern matching, and recursive processing.



\## Technologies



\- Haskell

\- Glasgow Haskell Compiler (GHC)



\## How It Works



The application starts with a balance of 1000.00 and processes sample transactions in sequence.



| Transaction | Amount | Result |

|---|---:|---|

| 101 | 250.00 | Successful |

| 102 | 900.00 | Insufficient balance |

| 103 | -50.00 | Invalid amount |

| 104 | 100.00 | Successful |



The final balance is 650.00.



\## Run Locally on Windows



Compile the source file using GHC:



```powershell

ghc Main.hs -o PaymentProcessor.exe

```



Run the executable:



```powershell

.\\PaymentProcessor.exe

```



\## Functional Programming Concepts



\- \*\*Pure functions:\*\* Payment validation and processing return results without modifying external state.

\- \*\*Immutability:\*\* Transaction records are not modified in place.

\- \*\*Pattern matching:\*\* Payment outcomes are handled using explicit constructors.

\- \*\*Recursion:\*\* Transactions are processed sequentially while passing the updated balance forward.

\- \*\*Algebraic data types:\*\* `Transaction` and `PaymentResult` represent the data and possible outcomes.



\## Scope



This is an educational simulation. It does not connect to a bank, payment gateway, or real payment system.



\## Future Improvements



\- Add automated unit tests.

\- Support user-entered transactions.

\- Add transaction history and summary reporting.

\- Use integer minor currency units instead of floating-point amounts.



