-- Problem 1: Market Analysis II (https://leetcode.com/problems/market-analysis-ii/)

with cte as(
select seller_id, item_id, item_brand from (
select seller_id, o.item_id as item_id, item_brand, order_date, rank() over (partition by seller_id order by order_date) as rnk
from orders o
join items i on o.item_id = i.item_id) as temp
where rnk = 2)


select user_id as seller_id,  
(case 
when  item_brand = favorite_brand then 'yes'
else 'no'
end) as '2nd_item_fav_brand'
from users 
left join cte on users.user_id = cte.seller_id







