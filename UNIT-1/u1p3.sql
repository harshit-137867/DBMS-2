DECLARE
	pro_name varchar2(50);
	qty number;
	price number;
	dicount_per number;
	total_amt number;
	dicount_amt number;
	net_amt number;
BEGIN
	-- Accept input from user
	pro_name := '&pro_name';
	qty := &quantity;
	price := &price_per_unit;
	dicount_per := &dicount_percentage;
	
	total_amt := qty * price;
	dicount_amt := (total_amt * dicount_per) / 100;
	net_amt := total_amt - dicount_amt;
	
	dbms_output.put_line('Product name : ' || pro_name);
	dbms_output.put_line('Quantity : ' || qty);
	dbms_output.put_line('Price per unit : ' || price);
	dbms_output.put_line('Total amount : ' || total_amt);
	dbms_output.put_line('Dicount amount : ' || dicount_amt);
	dbms_output.put_line('Net amount : ' || net_amt);
END;
/