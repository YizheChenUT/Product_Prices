#### Preamble ####
# Purpose: Cleans data from Project Hammer – Jacob Filipp.
# Author: Yizhe Chen
# Date: 14 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Donwload data from Project Hammer – Jacob Filipp.
# Any other information needed? No

-- Create a cleaned table cleaned_data and save the cleaned data to that table
CREATE TABLE cleaned_data AS
SELECT 
    -- Convert current_price and old_price to numeric types and clean them up
    CAST(current_price AS REAL) AS current_price,
    CAST(old_price AS REAL) AS old_price,
    
    -- Calculate the price difference as a new field price_difference
    CAST(current_price AS REAL) - CAST(old_price AS REAL) AS price_difference,
    
    -- Convert price_per_unit to a numeric type
    CAST(price_per_unit AS REAL) AS price_per_unit,
    
    -- Other fields retain original data
    product_id,
    nowtime,
    other

FROM raw

-- Filtering invalid and missing data
WHERE current_price IS NOT NULL 
  AND old_price IS NOT NULL
  AND current_price != '' 
  AND old_price != '';