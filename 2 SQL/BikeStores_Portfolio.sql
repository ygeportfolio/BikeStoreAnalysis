
-- ' VIEWING FULL DATA TO BE USED'
SELECT
	ord.order_id AS Order_ID, CONCAT(cus.first_name,' ', cus.last_name) AS Customer_Name,
	cus.city AS City, cus.state AS State, ord.order_date,
	sto.store_name AS Store_Name, bra.brand_name AS Brand_Name,
	pro.product_name AS Product_Name, cat.category_name AS Category_Name,
	SUM(ite.quantity) AS Total_Units, SUM(ite.quantity * ite.list_price) AS Revenue,
	CONCAT(sta.first_name,' ', sta.last_name) AS Sales_Rep
FROM sales.orders ord
	JOIN sales.customers cus
	ON ord.customer_id = cus.customer_id
	JOIN sales.order_items ite
	ON ord.order_id = ite.order_id
	JOIN production.products pro
	ON ite.product_id = pro.product_id
	JOIN production.categories cat
	ON cat.category_id = pro.category_id
	JOIN sales.stores sto
	ON ord.store_id = sto.store_id
	JOIN production.brands bra
	ON bra.brand_id = pro.category_id
	JOIN sales.staffs sta
	ON ord.staff_id = sta.staff_id
GROUP BY 
	ord.order_id, CONCAT(cus.first_name,' ', cus.last_name),
	cus.city, cus.state, ord.order_date, sto.store_name, bra.brand_name, cat.category_name, pro.product_name
	, CONCAT(sta.first_name,' ', sta.last_name)
ORDER BY 
	1,2
