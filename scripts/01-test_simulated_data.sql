#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data.
# Author: Yizhe Chen
# Date: 14 Nov 2024
# Contact: .yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.sql must have been run
# Any other information needed? No

-- Test 1: Verify the number of rows in simulated_price_changes
SELECT COUNT(*) AS row_count 
FROM simulated_price_changes;

-- Test 2: Check for null values in key columns
SELECT 
    COUNT(*) AS null_count
FROM simulated_price_changes
WHERE product_id IS NULL 
   OR base_price IS NULL 
   OR simulated_current_price IS NULL 
   OR percentage_change IS NULL;

-- Test 3: Verify that product_id values are between 1 and 10
SELECT 
    MIN(product_id) AS min_product_id,
    MAX(product_id) AS max_product_id
FROM simulated_price_changes;

-- Test 4: Verify that base_price values are between 1 and 500
SELECT 
    MIN(base_price) AS min_base_price,
    MAX(base_price) AS max_base_price
FROM simulated_price_changes;

-- Test 5: Verify that percentage_change values are between -25 and 25
SELECT 
    MIN(percentage_change) AS min_percentage_change,
    MAX(percentage_change) AS max_percentage_change
FROM simulated_price_changes;

-- Test 6: Verify that simulated_current_price matches the calculation base_price * (1 + price_variation)
SELECT 
    COUNT(*) AS mismatch_count
FROM simulated_price_changes
WHERE ABS(simulated_current_price - (base_price * (1 + (percentage_change / 100.0)))) > 0.01;
