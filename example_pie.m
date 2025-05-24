clear
close all

% Example on how to run make_pie with the AX32 XBT data (NOAA/AOML)

% LOAD DATA
load  AX32_timedata.mat

% CREATE X,Y AXES
data1 = str2num(timeYMD(:,5:6))'; %Month numbers
data2 = str2num(timeYMD(:,1:4))'; %year numbers

% GET DATA RANGE
axis1 = [min(data1):max(data1)]';
axis2 = [min(data2):max(data2)]';

% create month axis if wanted
leg1 = {'jan','feb','mar','apr','may','jun','jul','ago','sep','oct','nov','dec'};

% Add N number of spaces in the middle
N = 3;
C = npf; %number of profiles/transect

% MAKE PIE PLOTS
%1: month, year
make_pie(axis1,axis2,leg1,[],data1,data2,C,N)
print -dpng -r300 example_pie1.png

%2: year, month flipped
make_pie(axis2,flip(axis1),[],flip(leg1),data2,data1,C,N);
print -dpng -r300 example_pie2.png

%3: year, month
make_pie(axis2,axis1,[],leg1,data2,data1,C,N);
print -dpng -r300 example_pie3.png

%4: year, month - No axis labels
make_pie(axis2,axis1,[],[],data2,data1,C,N);
print -dpng -r300 example_pie4.png


