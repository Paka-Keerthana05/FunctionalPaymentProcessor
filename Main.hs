module Main where

data Transaction = Transaction
    { transactionId :: Int
    , amount :: Double
    } deriving (Show)

data PaymentResult
    = PaymentSuccess Int Double
    | InvalidAmount
    | InsufficientBalance
    deriving (Show)

validateAmount :: Double -> Bool
validateAmount value = value > 0

processPayment :: Double -> Transaction -> PaymentResult
processPayment balance transaction
    | not (validateAmount (amount transaction)) = InvalidAmount
    | amount transaction > balance = InsufficientBalance
    | otherwise =
        PaymentSuccess
            (transactionId transaction)
            (balance - amount transaction)

displayResult :: PaymentResult -> IO ()
displayResult result =
    case result of
        PaymentSuccess tid remaining ->
            putStrLn $
                "Payment successful! Transaction ID: "
                ++ show tid
                ++ ", remaining balance: "
                ++ show remaining

        InvalidAmount ->
            putStrLn "Payment failed: amount must be greater than zero."

        InsufficientBalance ->
            putStrLn "Payment failed: insufficient balance."


processTransactions :: Double -> [Transaction] -> [(Transaction, PaymentResult)]
processTransactions _ [] = []
processTransactions balance (transaction : rest) =
    let result = processPayment balance transaction

        nextBalance =
            case result of
                PaymentSuccess _ remaining -> remaining
                _ -> balance

    in (transaction, result)
        : processTransactions nextBalance rest

main :: IO ()
main = do
    putStrLn "=== Functional Payment Transaction Processor ==="

    let initialBalance = 1000.00

    let transactions =
            [ Transaction 101 250.00
            , Transaction 102 900.00
            , Transaction 103 (-50.00)
            , Transaction 104 100.00
            ]

    putStrLn $ "Initial balance: " ++ show initialBalance

    let results = processTransactions initialBalance transactions

    mapM_ (\(transaction, result) -> do
        putStrLn $ "\nProcessing transaction: "
            ++ show (transactionId transaction)
        displayResult result
        ) results
