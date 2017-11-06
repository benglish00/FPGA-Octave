function scanData = rectify_scan(rawCal,rawScan)
### This function rectifies column 3 in rawScan with
### column 3 in a calibration file, rawCal
### rawCal = n x 3 calibration matrix  (Tx, FFT, Envelope)
### rawScan = n x 3 scan data matrix   (Tx, FFT, Envelope)
### -------------------------------------
### param rawCal : any x 3 matrix double
### param rawScan : numPoints x 3 matrix double
### return scanData : numPoints x 3 matrix double

calMat = make_cal_matrix(rawCal);
		
# Subtract Calibration Values
 numPoints = size(rawScan)(1);
 scanData = zeros(size(rawScan));
 scanData(:,1:2) = rawScan(:,1:2);
 for i = 1:numPoints
	Tx = rawScan(i,1);
	idx = find(calMat(:,1)==Tx);
	scanData (i,3) = rawScan(i,3)- calMat(idx,3);
	endfor
scanData = sortrows(scanData,1);
endfunction
