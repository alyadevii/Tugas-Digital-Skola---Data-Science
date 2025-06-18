--Soal 1 
select distinct "Product_Description"  from online_sales oe
where cast("Transaction_Date" as TEXT) like '2019-07%'

--Soal 2
select "Product_Category", sum_Quantity from (select "Product_Category",sum ("Quantity")as sum_Quantity
from ecommerce.online_sales 
group by ("Product_Category")
)
where sum_Quantity > 20000

---CTE (Common Table Expression)
with Jumlah_Quantity as (
select "Product_Category",sum ("Quantity")as sum_quantity
from ecommerce.online_sales 
group by ("Product_Category")
)

select "Product_Category", sum_quantity from Jumlah_Quantity
where sum_quantity > 20000


--Soal 3
select avg("Quantity"*"Avg_Price")as gmv 
from ecommerce.online_sales
where "Product_Category" = 'Bags'

--Soal 4
--bandingkan semua customer dengan rata rata tiap lokasi
with tm as(
select "Location",avg ("Tenure_Months")as rata_rata from ecommerce.customers
group by "Location"),

ct as 
(select * from ecommerce.customers)

select ct."CustomerID",ct."Location",ct."Tenure_Months",tm."rata_rata" from tm 
left join ct on ct."Location" = tm."Location"
where ct."Tenure_Months" > tm.rata_rata

--membandingkan customer terhadap rata rata global customer
select
	"CustomerID",
	"Location"
from ecommerce.customers c 
where "Tenure_Months" > (select avg("Tenure_Months")
							from ecommerce.customers)


--Soal 5
  select distinct "Transaction_Date", "Location"
  from (select * from ecommerce.online_sales t1
  join ecommerce.customers t2
  on t1."CustomerID" = t2."CustomerID")
  where "Location" LIKE 'New%'


--Commit Alya
select * from ecommerce.online_sales
where "Transaction_Date" like '2019-07%'

--Commit Aris
select * from ecommerce.customers












