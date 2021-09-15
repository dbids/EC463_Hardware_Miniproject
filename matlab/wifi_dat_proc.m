%% Loading data

% 1. Go to Home > Import Data
% 2. Select delimited, variable type: cell
% 3. Change the imported variable name to dataset, save to mat file:
% save('datax.mat','dataset'

load manytest.mat
dataset=manydata;
N = size(dataset,2);
% Get rid of half data points at the end
if mod(N,7)
    if ~mod(N-1,7)
        dataset(:,N) = [];
        N = N-1;
    elseif ~mod(N-2,7)
        dataset(:,N-1:N) = [];
        N = N-2;
    elseif ~mod(N-3,7)
        dataset(:,N-2:N) = [];
        N = N-3;
    elseif ~mod(N-4,7)
        dataset(:,N-3:N) = [];
        N = N-4;
    elseif ~mod(N-5,7)
        dataset(:,N-4:N) = [];
        N = N-5;
    elseif ~mod(N-6,7)
        dataset(:,N-5:N) = [];
        N = N-6;
    end
end

% Parse through data and separate each table element into a vector
c=0;
for ii = 1:7:N
    c = c+1;
    freq(c) = str2double(dataset{2,ii});
end
c=0;
for ii = 2:7:N
    c = c+1;
    unit = dataset{2,ii};
    if strcmp(unit,'GHz')
        freq(c) = freq(c)*1e9;
    else
        fprintf('New frequency! count: %d\n',c)
    end
end
c=0;
for ii = 3:7:N
    c=c+1;
    channel(c) = str2double(dataset{2,ii});
end
c=0;
for ii = 4:7:N
    c=c+1;
    signal_qual(c) = str2double(dataset{2,ii});
end
c=0;
for ii = 5:7:N
    c=c+1;
    signal_total(c) = str2double(dataset{2,ii});
end
c=0;
for ii = 6:7:N
    c=c+1;
    signal_level_dbm(c) = str2double(dataset{2,ii});
end
c=0;
for ii=7:7:N
    c=c+1;
    essid{c} = dataset{2,ii};
end

%% Data processing
num = c;
ongoing_marker = [];

% Count repeats
for ii=1:num
    if ~(sum(ismember(ongoing_marker,ii))>0)
        
        
        
        
    end
end
