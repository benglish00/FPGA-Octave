function status = make_plots(recScan, polyData, peaks)
	scale = 1/10000;
	TxLabel = cstrcat("Peak amplitude at ", num2str(peaks(1))," MHz.")
	RxLabel = cstrcat("Mean Rx FFT ", num2str(peaks(2))," MHz.")
	plot(recScan(:,1),recScan(:,3)*scale,'+');
	hold
	plot(polyData(:,1),polyData(:,3)*scale,'r');
		titleStr = cstrcat("FPGA amplitude");
		title(titleStr)
		xlabel("Tx Frequency [MHz]")
		ylabel("Amplitude []")
		legend("Data", "Piecewise polynomial","location",'northeast')
		xlim([14 30])
		ylim([-.2 max(polyData(:,3))*scale])
		text(14.5,max(polyData(:,3))*0.9*scale, TxLabel);
		text(14.5,max(polyData(:,3))*0.8*scale, RxLabel);
	figure
	scale = 1/1;
	plot(recScan(:,1),recScan(:,2)*scale,'+');
	hold
	plot(polyData(:,1),polyData(:,2)*scale,'r');
		titleStr = cstrcat("FPGA FFT");
		title(titleStr)
		xlabel("Tx Frequency [MHz]")
		ylabel("Rx Frequency [MHz]")
		legend("Data", "Piecewise polynomial","location",'northeast')
		xlim([14 30])
		ylim([4 20])
		text(15,19,TxLabel);
		text(15,18.5,RxLabel);
	fileNameAmp = strcat("AMP_", num2str(peaks(2)), ".png");
	fileNameFFT = strcat("FFT_", num2str(peaks(2)), ".png");
#		saveas(1,fileNameAmp);
#		saveas(2,fileNameFFT);
	endfunction
