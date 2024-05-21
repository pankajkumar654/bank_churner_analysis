
-- Distribution of attrited customers based on age range
select 
case when "Customer_Age" < 20 then '0-20'
	when "Customer_Age" between 20 and 30 then '20-30'
	when "Customer_Age" between 30 and 40 then '30-40'
	when "Customer_Age" between 40 and 50 then '40-50'
	when "Customer_Age" between 50 and 60 then '50-60'
	when "Customer_Age" between 60 and 70 then '60-70'
	when "Customer_Age" > 80 then 'Above 80' end as age_range,count(*) 
from customers.bankchurners b
where "Attrition_Flag" = 'Attrited Customer'
group by age_range
order by age_range;
-- The number of customers who had left the bank is the highest for the customers who are between the age of 40-50

-- Number of males and females in Existing customers
select "Gender",
  sum(case 
     when "Attrition_Flag" = 'Existing Customer' then 1	
  end) as Existing_customers
from customers.bankchurners b
group by "Gender" ;
-- Male existing customers are 4072 whereas female existing cutomers are 4428

-- Number of males and females in Existing customers
select "Gender",
  sum(case
	when "Attrition_Flag" ='Attrited Customer' then 1
	else 0 
     end)as Attrited_customer
from customers.bankchurners b
group by "Gender" ;
-- Male Attrited Customers are 697 whereas female Attrited Cutomers are 930

-- Education_Level distribution of existing and attrited customers

select "Education_Level" ,count(*) from customers.bankchurners b 
where "Attrition_Flag" ='Existing Customer'
group by "Education_Level" 
order by 2;

select "Education_Level" ,count(*) from customers.bankchurners b
where "Attrition_Flag" ='Attrited Customer'
group by "Education_Level" 
order by 2;
-- Those customers who are graduate and in High School have a very high attrition rate as compared to existing customers.


-- Marital status wise distribution of existing and attrited customers

select "Marital_Status" ,count(*) from customers.bankchurners b 
where "Attrition_Flag" ='Existing Customer'
group by "Marital_Status" 
order by 2;

select "Marital_Status" ,count(*) from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by "Marital_Status" 
order by 2;
-- The number of customers who had left the bank is the highest for the customers who are married.


-- Distribution of attrited customers based on months on book
select 
	case 
		when "Months_on_book"< 20 then '0-20'
		when "Months_on_book" between 20 and 30 then '20-30'
		when "Months_on_book" between 30 and 40 then '30-40'
		when "Months_on_book" between 40 and 60 then '40-60'
		when "Months_on_book" between 60 and 70 then '60-70'
		when "Months_on_book">80 then 'Above 80'
end as months_on_book_range,count(*)
from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by months_on_book_range
order by 2;
-- The number of customer is highest for the MonthOnBOOK range of 30-40 years

-- attrited customer based on income 
select "Income_Category", count(*)
from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by "Income_Category" 
order by 2;


-- distribution of attrited customers based on credit_limit
select "Credit_Limit" ,count(*)
from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by "Credit_Limit" 
order by 2;


select "Months_Inactive_12_mon",count(*) 
from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by "Months_Inactive_12_mon" 
order by 2;

select "Avg_Utilization_Ratio" ,count(*) 
from customers.bankchurners b 
where "Attrition_Flag" ='Attrited Customer'
group by "Avg_Utilization_Ratio" 
order by 2;
--We can summarize that lesser the utilisation on the customer's card the higher the chance of attrition.
