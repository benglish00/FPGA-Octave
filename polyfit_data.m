function polyData = polyfit_data(recScan)
		numBreaks = 8;
		amplitudePP = splinefit(recScan(:,1),recScan(:,3),numBreaks);
		fftPP = splinefit(recScan(:,1),recScan(:,2),20);
		xPP = 14:0.025:30;
		polyData = [xPP',ppval(fftPP,xPP)',ppval(amplitudePP,xPP)'];
endfunction
