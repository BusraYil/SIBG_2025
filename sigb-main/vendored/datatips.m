function datatips()
%DATATIPS   Correct broken data tips behaviour in plots (ver 1.0)
%   DATATIPS selects the normal data tips behaviour in plots. When data
%   tips are used, it will show the X,Y coordinates instead of the useless
%   frequency, time and power data for each coordinate.

fh=gcf();
DCM=datacursormode(fh);
DCM.UpdateFcn=[];
