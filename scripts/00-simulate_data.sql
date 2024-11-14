#### Preamble ####
# Purpose: Simulates a dataset of current price, including product id, base price and price variation
# Author: Yizhe Chen
# Date: 11 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No

-- Create a new table to simulate future price fluctuations
CREATE TABLE simulated_price_changes AS
WITH simulated_data AS (
    SELECT
        1 + (RANDOM() % 10) AS product_id,  -- Simulate 10 different products with IDs from 1 to 10
        ABS(RANDOM() % 500) + 1 AS base_price,  -- Generate a random base price up to 500
        ABS(RANDOM() % 50 - 25) / 100.0 AS price_variation -- Generate a random price variation between -25% and +25%
    FROM generate_series(1, 100) -- Generate 100 rows of data
)
SELECT 
    product_id,
    base_price,
    base_price * (1 + price_variation) AS simulated_current_price, -- Apply price variation to simulate current price
    price_variation * 100 AS percentage_change -- Calculate the percentage change in price
FROM simulated_data;
