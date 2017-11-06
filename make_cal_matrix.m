function meanMat = make_cal_matrix(rawCal)
### This function imports matrix "rawCal" where values in column 1 repeats.
### The matrix is sorted by Col 1 values.
### Values in col 2 and col 3 are averaged for each common col 1 value.
### The function returns meanMat, which is an array of single col 1 values
### with the averaged col 2 and col 3 values
###
### n = 1 to 3
### param rawCal : i x n matrix double
### return meanMat : m x n matrix double
		rawCal = sortrows(rawCal,1);  #sort rows by col 1 value
		numPoints = size(rawCal)(1);  
		i =1; m=1; n=1  ;
		# i = row index for rawCal, 
		# m = row inde for meanMat
		# n = column for both rawCal and meanMat
		do
			Tx = rawCal(i,1);   #The Tx value to search for and average
			idxTx = find(rawCal(:,1)==Tx); 
				for n = 1:3
					meanMat(m,n) = mean(rawCal(idxTx(1):idxTx(end),n));
				endfor
				m++;
				i = idxTx(end)+1;
		until (Tx == max( rawCal(:,1)))
endfunction
