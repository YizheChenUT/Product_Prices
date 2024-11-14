#### Preamble ####
# Purpose: Tests Analysis data from Project Hammer – Jacob Filipp.
# Author: Yizhe Chen
# Date: 14 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: 03-data_analysis.sql must have been run
# Any other information needed? No

-- Test 1: Check that cleaned_data table was created and has rows
SELECT COUNT(*) AS row_count
FROM cleaned_data;

-- Expected result: row_count > 0

-- Test 2: Verify that current_price, old_price, and price_difference columns do not contain NULL values
SELECT 
    COUNT(*) AS null_count
FROM cleaned_data
WHERE current_price IS NULL 
   OR old_price IS NULL 
   OR price_difference IS NULL;

-- Expected result: null_count = 0

-- Test 3: Ensure that price_difference is calculated correctly as (current_price - old_price)
SELECT 
    COUNT(*) AS mismatch_count
FROM cleaned_data
WHERE ABS(price_difference - (current_price - old_price)) > 0.01;

-- Expected result: mismatch_count = 0

-- Test 4: Verify that price_per_unit has been converted to a numeric type and does not contain NULL values
SELECT 
    COUNT(*) AS null_price_per_unit_count
FROM cleaned_data
WHERE price_per_unit IS NULL;

-- Expected result: null_price_per_unit_count = 0

-- Test 5: Check that product_id, nowtime, and other columns retain non-null values where expected
SELECT 
    COUNT(*) AS null_non_critical_columns
FROM cleaned_data
WHERE product_id IS NULL 
   OR nowtime IS NULL 
   OR other IS NULL;

-- Expected result: null_non_critical_columns = 0

-- Test 6: Check that there are no empty strings ('') in current_price and old_price
SELECT 
    COUNT(*) AS empty_string_count
FROM cleaned_data
WHERE current_price = '' 
   OR old_price = '';

-- Expected result: empty_string_count = 0
