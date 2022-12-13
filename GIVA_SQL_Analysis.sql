create table transaction(
transaction_id varchar(100),
customer_id varchar(100),
Customer_name varchar(200),
Email varchar(200),
Phone varchar(100),
Date_of_purchase date,
SKU_bought varchar(600),
Total_price float (50),
Discount float (50)
);


insert into transaction values 
('10001',	'1001',	'Karthik',	    'gymboii@gmail.com',	'9876543210',	'2022-01-01',	'1233963, 568297',	2895.49,	491.51),
('10002',	'1004',	'Vimal',	    'vimala@gmail.com',	'9876543213',	'2022-01-01',	'649311',	949.55,	49.45),
('10003',	'1002',	'Gokul',	    'gokul@gmail.com',	'9876543211',	'2022-01-01',	'854731',	949.55,	49.45),
('10004',	'1007',	'Rammorthy',	'kutty@gmail.com',	'9876543216',	'2022-01-02',	'881054',	629.3,	269.7),
('10005',	'1013',	'Ajay ',	    'aj@gmail.com',	'9876543222',	'2022-01-05',	'927268',	139.3,	259.7),
('10006',	'1003',	'Boopal',	    'paavada@gmail.com',	'9876543212',	'2022-01-06',	'1233963',	899.6,	99.4),
('10007',	'1014',	'Mani',	        'tintin@gmail.com',	'9876543223',	'2022-01-06',	'7151260, 1233963',	5248.56,	2249.54),
('10008',	'1006',	'Hari',	        'sodabutty@gmail.com',	'9876543215',	'2022-01-06',	'1697622',	629.3,	269.7),
('10009',	'1015',	'Eswar',	    'eli@gmail.com',	'9876543224',	'2022-01-08',	'2183689',	419.3,	179.7),
('10010',	'1001',	'Karthik',	    'gymboii@gmail.com',	'9876543210',	'2022-01-09',	'2230994',	909.3,	389.7),
('10011',	'1010',	'Aravind',	    'kodan@gmail.com',	'9876543219',	'2022-01-12',	'7148538',	209.3,	89.7),
('10012',	'1005',	'Mohan',	   'mokka@gmail.com',	'9876543214',	'2022-01-12',	'7151260',	4899.3,	2099.7),
('10013',	'1011',	'Aravindhsamy',	'swamiji@gmail.com',	'9876543220',	'2022-01-15',	'7155901',	899.6,	99.4),
('10014',	'1008',	'Guha',	'cooker@hotmail.com',	'9876543217',	'2022-01-15',	'7156989',	442,	57),
('10015',	'1009',	'Akshay',	'robot@gmail.com',	'9876543218',	'2022-01-16',	'7219171',	209.3,	89.7),
('10016',	'1003',	'Boopal',	'paavada@gmail.com',	'9876543212',	'2022-01-17',	'568297',	1995.89,	392.11),
('10017',	'1010',	'Aravind',	'kodan@gmail.com',	'9876543219',	'2022-01-19',	'649311',	949.55,	49.45),
('10018',	'1002',	'Gokul',	'gokul@gmail.com',	'9876543211',	'2022-01-20',	'854731',	949.55,	49.45),
('10019',	'1012',	'Vivek',	'vp@gmail.com',	'9876543221',	'2022-01-20',	'881054',	629.3,	269.7),
('10020',	'1010',	'Aravind',	'kodan@gmail.com',	'9876543219',	'2022-01-24',	'927268',	139.3,	259.7),
('10021',	'1011',	'Aravindhsamy',	'swamiji@gmail.com',	'9876543220',	'2022-01-28',	'1233963',	899.6,	99.4),
('10022',	'1014',	'Mani',	'tintin@gmail.com',	'9876543223',	'2022-01-28',	'1233963',	349.3,	149.7),
('10023',	'1005',	'Mohan',	'mokka@gmail.com',	'9876543214',	'2022-02-01',	'1697622',	629.3,	269.7),
('10024',	'1016',	'Vishak',	'sako@gmail.com',	'9876543225',	'2022-02-03',	'2183689',	419.3,	179.7),
('10025',	'1010',	'Aravind',	'kodan@gmail.com',	'9876543219',	'2022-02-02',	'2230994',	909.3,	389.7),
('10026',	'1002',	'Gokul',	'gokul@gmail.com',	'9876543211',	'2022-02-05',	'9272687, 148538',	348.6,	349.4),
('10027',	'1013',	'Ajay ',	'aj@gmail.com',	'9876543222',	'2022-02-09',	'7151260',	4899.3,	2099.7),
('10028',	'1011',	'Aravindhsamy',	'swamiji@gmail.com',	'9876543220',	'2022-02-15',	'7155901',	899.6,	99.4),
('10029',	'1010',	'Aravind',	'kodan@gmail.com',	'9876543219',	'2022-02-15',	'7156989',	442,	57),
('10030',	'1001',	'Karthik',	'gymboii@gmail.com',	'9876543210',	'2022-02-18',	'7219171',	209.3,	89.7);


/*Name and list of customers who purchased more than once*/

select  temp.Customer_name from
	(select customer_id, 
			customer_name, 
            count(transaction_id) as transactions from transaction 
            group by customer_name, customer_id) as temp 
	where temp.transactions>1;

/*Highest selling item name*/

select SKU_bought, 
    count(SKU_bought) as total_sales 
    from transaction group by SKU_bought 
    order by count(SKU_bought) desc limit 1;
    
/*Number of times a customer purchases on an average in a month*/

select t.Customer_name, 
	   avg(t.total_transactions) as Average_Purchase 
			from (select Customer_name, 
						 count( transaction_id) as total_transactions 
                         from transaction 
				  group by Customer_name)as t
		group by t.Customer_name;
        
        
/*List of all customers who have purchased items worth more than Rs. X (here X should be a variable)*/

SET @X:= 1000;

select t.customer_name, 
		t.sales_amount 
		from(select Customer_name, 
					sum(Total_price) as sales_amount 
			from transaction
		group by Customer_name) as t
where t.sales_amount>@X;        

        



