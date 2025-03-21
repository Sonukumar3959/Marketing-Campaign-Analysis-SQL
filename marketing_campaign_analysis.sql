-- Code to Create the Table & Insert Data

CREATE TABLE marketing_campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(100),
    channel VARCHAR(50), -- (Google Ads, Facebook, Email, etc.)
    impressions INT,
    clicks INT,
    conversions INT,
    revenue DECIMAL(10,2),
    campaign_date DATE
);

INSERT INTO marketing_campaigns (campaign_name, channel, impressions, clicks, conversions, revenue, campaign_date) 
VALUES 
('Holiday Sale', 'Google Ads', 10000, 800, 50, 5000, '2024-02-01'),
('Winter Discount', 'Facebook', 12000, 600, 40, 4200, '2024-02-02'),
('Email Promo', 'Email', 8000, 500, 35, 3100, '2024-02-03'),
('Black Friday', 'Google Ads', 20000, 1500, 120, 9800, '2024-02-04'),
('New Year Special', 'Instagram', 15000, 900, 75, 7200, '2024-02-05');


select * from marketing_campaigns


--1️⃣ Calculate CTR (Click-Through Rate) for Each Campaign

SELECT 
    campaign_name,
    channel,
    impressions,
    clicks,
    ROUND((clicks::DECIMAL / impressions) * 100, 2) AS ctr_percentage
FROM marketing_campaigns
ORDER BY ctr_percentage DESC;


--2️⃣ Calculate Conversion Rate

SELECT 
    campaign_name,
    channel,
    clicks,
    conversions,
    ROUND((conversions::DECIMAL / clicks) * 100, 2) AS conversion_rate
FROM marketing_campaigns
ORDER BY conversion_rate DESC;


--3️⃣ Identify Top Performing Campaigns by Revenue

SELECT campaign_name, channel, revenue from marketing_campaigns
order by revenue DESC
limit 3


--4️⃣ Find Trends Over Time Using Window Functions

SELECT campaign_name, campaign_date, 
sum(clicks) over(order by campaign_date),
sum(conversions) over(order by campaign_date)
from marketing_campaigns






