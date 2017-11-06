clear all;
clc;
import2files;  #Imports rawCal and rawScan to test the following code
recScan = rectify_scan(rawCal,rawScan);
polyData = polyfit_custom(recScan);
peaks = find_peaks(polyData);
make_plots(recScan, polyData, peaks)

