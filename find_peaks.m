function peaks = find_peaks(polyData)
	### Finds the sensor value from the polyfit data
	### MaxTx is the Tx frequency corresponding to the peak amplitude
	### meanRx is a windowed average near the Tx frequency @ peak amplitude
	### maxAmp is the peak amplitude
	### param PolyData : n x 3 double
	### return peaks : 
	maxAmp = max(polyData(:,3));
	idx = find(polyData(:,3)==maxAmp);
	maxTx = polyData(idx,1);
	meanRx = mean(polyData(idx-3:idx+3,2));
	peaks(1) = maxTx;
	peaks(2) = meanRx;
	peaks(3) = maxAmp;
	endfunction
