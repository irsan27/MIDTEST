CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT item
FROM item_bought
GROUP BY item
HAVING COUNT(*) != (SELECT MAX(purchase_count) 
                    FROM (SELECT COUNT(*) AS purchase_count 
                          FROM item_bought 
                          GROUP BY item) AS purchase_counts)
   AND COUNT(*) != (SELECT MIN(purchase_count) 
                    FROM (SELECT COUNT(*) AS purchase_count 
                          FROM item_bought 
                          GROUP BY item) AS purchase_counts); SELECT item
FROM item_bought
GROUP BY item
HAVING COUNT(*) != (SELECT MAX(purchase_count) 
                    FROM (SELECT COUNT(*) AS purchase_count 
                          FROM item_bought 
                          GROUP BY item) AS purchase_counts)
   AND COUNT(*) != (SELECT MIN(purchase_count) 
                    FROM (SELECT COUNT(*) AS purchase_count 
                          FROM item_bought 
                          GROUP BY item) AS purchase_counts);