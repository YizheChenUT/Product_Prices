#### Preamble ####
# Purpose: Analyse data from Project Hammer – Jacob Filipp.
# Author: Yizhe Chen
# Date: 14 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Clean data from Project Hammer – Jacob Filipp
# Any other information needed? No

-- Basic statistical information
SELECT 
    AVG(current_price) AS avg_current_price,
    MAX(current_price) AS max_current_price,
    MIN(current_price) AS min_current_price,
    
    AVG(old_price) AS avg_old_price,
    MAX(old_price) AS max_old_price,
    MIN(old_price) AS min_old_price,

    AVG(price_difference) AS avg_price_difference,
    MAX(price_difference) AS max_price_difference,
    MIN(price_difference) AS min_price_difference
FROM cleaned_data;

-- Calculation of the percentage change in prices
SELECT 
    product_id,
    (current_price - old_price) / old_price * 100 AS price_change_percentage
FROM cleaned_data
WHERE old_price > 0;

-- Calculate the correlation between current_price and price_per_unit.
SELECT 
    (AVG(current_price * price_per_unit) - AVG(current_price) * AVG(price_per_unit)) / 
    (sqrt(AVG(current_price * current_price) - AVG(current_price) * AVG(current_price)) * 
     sqrt(AVG(price_per_unit * price_per_unit) - AVG(price_per_unit) * AVG(price_per_unit))) AS correlation
FROM cleaned_data;
