USE crypto; 

#Checking what each table contains
select * from cryptocurrency;

select * from transaction;

select * from user;

select * from user_wallet;

#Start of exploratory
## Analytics Queries
#1. **Total Value of Cryptocurrencies in User Wallets**: Calculates the total value of cryptocurrencies held by each user.
# Getting all the Data between the cryptocurrency, user and their wallet
SELECT 
    *
FROM
    user u
        JOIN
    user_wallet uw ON u.user_id = uw.user_id
        JOIN
    cryptocurrency c ON uw.crypto_id = c.crypto_id;

SELECT 
    CONCAT('$', FORMAT(SUM(value * price), 2)) AS total_crypto
FROM
    user u
        JOIN
    user_wallet uw ON u.user_id = uw.user_id
        JOIN
    cryptocurrency c ON uw.crypto_id = c.crypto_id;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    CONCAT('$', FORMAT(SUM(value * price), 2)) AS total_possession
FROM
    user u
        JOIN
    user_wallet uw ON u.user_id = uw.user_id
        JOIN
    cryptocurrency c ON uw.crypto_id = c.crypto_id
GROUP BY u.user_id;

#2. **Most Traded Cryptocurrency**: Finds the cryptocurrency with the highest number of transactions.
SELECT 
    *
FROM
    transaction;

SELECT 
    crypto_name, COUNT(*)
FROM
    transaction t
        JOIN
    cryptocurrency c ON t.crypto_id = c.crypto_id
GROUP BY t.crypto_id;

SELECT 
    crypto_name, COUNT(*) AS tx_number
FROM
    transaction t
        JOIN
    cryptocurrency c ON t.crypto_id = c.crypto_id
GROUP BY t.crypto_id
ORDER BY tx_number DESC
LIMIT 1;

#3. **Users with the Highest Number of Transactions**: Identifies users who have made the most transactions.
select * from transaction;

#Get user with most transaction count
select CONCAT(first_name, ' ', last_name) AS full_name, count(*) as no_of_transaction
from user u left join transaction t on u.user_id = t.user_id
group by u.user_id;

#We could also explore what Crypto each user traded the most
#Make this as the CTE to know what each user and their transactions
select CONCAT(first_name, ' ', last_name) AS full_name, count(*) as no_of_transaction, t.crypto_id
from user u left join transaction t on u.user_id = t.user_id
group by u.user_id,t.crypto_id;

#Use the CTE and max() function to find their most transacted crypto
WITH UserCryptoCounts AS (
    SELECT 
        u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        t.crypto_id,
        COUNT(*) AS no_of_transactions
    FROM 
        user u
    LEFT JOIN 
        transaction t ON u.user_id = t.user_id
    GROUP BY 
        u.user_id, t.crypto_id
)

SELECT 
    full_name,
    crypto_id,
    no_of_transactions
FROM 
    UserCryptoCounts
WHERE 
    (user_id, no_of_transactions) IN (
        SELECT 
            user_id, 
            MAX(no_of_transactions)
        FROM 
            UserCryptoCounts
        GROUP BY 
            user_id
    );

#4. **Pending Transactions**: Lists all transactions that are currently pending.
SELECT 
    *
FROM
    transaction
WHERE
    tx_status LIKE 'Pending';

#5. **Average Transaction Amount per Cryptocurrency**: Calculates the average transaction amount for each cryptocurrency.
select * 
from transaction t join cryptocurrency c on t.crypto_id = c.crypto_id;

select crypto_name, Format(avg(amount),2) as average_tx_vol 
from transaction t join cryptocurrency c on t.crypto_id = c.crypto_id
group by c.crypto_id;

#6. Users with Pending Transactions
select * 
from user u left join transaction t on u.user_id = t.user_id
where tx_status like 'pending';

#7. Transaction History of a Specific User
select * 
from user u left join transaction t on u.user_id = t.user_id
where u.user_id = 2;

#8. Users with the Most Diverse Cryptocurrency Holdings
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, count(distinct(uw.crypto_id))
FROM
    user u
        JOIN
    user_wallet uw ON u.user_id = uw.user_id
    group by u.user_id;