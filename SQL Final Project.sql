create database finalproject;
use finalproject;
select* from walmart;

UPDATE walmart  
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');  

ALTER TABLE walmart  
MODIFY COLUMN Date DATE; 
ALTER TABLE walmart  
MODIFY COLUMN Time Time; 

/*Task 1: Identifying the Top Branch by Sales Growth Rate */
with MonthlySales as(
    select 
        Branch,
        date_format(Date, '%Y-%m') as month,
        sum(Total) as total_sales
    from walmart
    group by Branch, date_format(Date, '%Y-%m')
)
select
    Branch,
   round( (max(total_sales) - min(total_sales)) / min(total_sales) * 100 ,2) as growth_rate
from MonthlySales
group by Branch
order by growth_rate desc;


/*Task 2: Finding the Most Profitable Product Line for Each Branch 
Walmart needs to determine which product line contributes the highest profit to each branch.The profit margin
should be calculated based on the difference between the gross income and cost of goods sold.*/

select Branch , `Product line` , profit , rank_order from (
select Branch , `Product line` , 
sum(`gross income`- cogs) as profit,
rank() over (partition by Branch order by sum('gross income'-cogs) desc) as rank_order
from walmart
group by Branch, `Product Line`
) as ranking where rank_order = 1;


/*Task 3: Analyzing Customer Segmentation Based on Spending 
Walmart wants to segment customers based on their average spending behavior. Classify customers into three
tiers: High, Medium, and Low spenders based on their total purchase amounts.*/


select `Customer ID`, round(avg(Total),2) as avg_spend ,
case when avg(Total)<275 then 'Low'
when avg(Total) >275 and avg(Total)<325 then 'Medium'
else 'High' 
end as spending_tier
from walmart
group by `Customer ID`;


/*Task 4: Detecting Anomalies in Sales Transactions 
Walmart suspects that some transactions have unusually high or low sales compared to the average for the
product line. Identify these anomalies*/
 
select 
    `invoice id`,
    `branch`,
    `city`,
    `customer type`,
    `product line`,
    `total`,
    case 
        when total > (avg_total + 2 * stddev_total) then 'high'
        when total < (avg_total - 2 * stddev_total) then 'low'
    end as sale_status
from (
    select 
        w.*,
        (select avg(total) 
         from walmart 
         where `product line` = w.`product line`) as avg_total,
        (select stddev(total) 
         from walmart 
         where `product line` = w.`product line`) as stddev_total
    from 
        walmart as w
) as sub
where 
    total > (avg_total + 2 * stddev_total)
    or total < (avg_total - 2 * stddev_total);

 
 
/*Task 5: Most Popular Payment Method by City 
Walmart needs to determine the most popular payment method in each city to tailor marketing strategies.*/

select Payment , count(*) as no_of_times_used
from walmart 
group by Payment 
order by no_of_times_used desc 
limit 1;


/*Task 6: Monthly Sales Distribution by Gender 
Walmart wants to understand the sales distribution between male and female customers on a monthly basis.*/

select
     Gender,  monthname(Date) as month_,
 
    sum(Total) as total_sale,
    rank() over(partition by Gender order by sum(Total) desc) as rank_
from
    walmart
group by 
    Monthname(date), Gender;
    
    
/*Task 7: Best Product Line by Customer Type 
Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).*/

with RankedProducts as (
    select
        `Customer Type`, 
        `Product line`,
        COUNT(`Product line`) AS no_of_tyme_choosen,
        rank() over(partition by `Customer Type` order by COUNT(`Product line`) desc) as rank_
    from
        walmart 
    group by
        `Product line`, `Customer Type`
)
select *
from RankedProducts
where rank_ = 1;

/*Task 8: Identifying Repeat Customers 
Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30
days).*/

select 
    w1.`Customer ID`,
    MIN(w1.`Date`) as first_purchase_date,
    MIN(w2.`Date`) as repeat_purchase_date
from
    walmart w1
join
    walmart w2 on w1.`Customer ID` = w2.`Customer ID`
where
    w2.`Date` > w1.`Date` 
    and DATEDIFF(w2.`Date`, w1.`Date`) <= 30
group by 
    w1.`Customer ID`;
    

/*Task 9: Finding Top 5 Customers by Sales Volume 
Walmart wants to reward its top 5 customers who have generated the most sales Revenue.*/

Select `Customer ID` , rounD(sum(total),2) as total_revenue
from walmart
group by `Customer ID`
order by total_revenue desc
limit 5;

/*Task 10: Analyzing Sales Trends by Day of the Week (6 Marks)
Walmart wants to analyze to determine which day of the week
brings the highest sales.*/

select dayname(Date) as weekday_, rounD(sum(total),2) as total_revenue, sum(Quantity) as quantity_sold
from walmart
group by weekday_
order by total_revenue desc
limit 1;









 


 






