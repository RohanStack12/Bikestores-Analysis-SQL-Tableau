SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name) AS customers,
	cus.city,
	cus.state,
	order_date,
	SUM(ite.quantity) AS units,
	SUM(ite.quantity*ite.list_price) AS revenue,
	pro.product_name,
	br.brand_name,
	cat.category_name,
	sto.store_name,
	CONCAT(staff.first_name, ' ',staff.last_name) AS sales_rep
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON pro.product_id = ite.product_id
JOIN production.categories cat
ON  pro.category_id = cat.category_id
JOIN production.brands br
ON pro.brand_id  = br.brand_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs staff
ON ord.staff_id =  staff.staff_id
GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	order_date,
	pro.product_name,
	br.brand_name,
	cat.category_name,
	sto.store_name,
	CONCAT(staff.first_name, ' ',staff.last_name)
