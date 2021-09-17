%% Loading data

% 1. Go to Home > Import Data
% 2. Select delimited, variable type: cell
% 3. Save to mat file: save('data_x.mat','data')

load data.mat
dataset=dataset3;
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
marker = [];
names = cell(1);
num_occurs = [];
index_occurs = [];

% Count repeats
num_names = 0;
for ii=1:num
    if ~(sum(ismember(marker,ii))>0) % if ii hasn't been marked yet
        num_names = num_names + 1;
        marker = [marker ii];
        thisname = essid{ii};
        names{num_names} = thisname;
        num_occurs(num_names) = 1;
        index_occurs(num_occurs(num_names),num_names) = ii;
        for jj = ii:num
            if ~(sum(ismember(marker,jj))>0) % if jj hasn't been marked
                if strcmp(thisname,essid{jj}) % if the name repeats
                    num_occurs(num_names) = num_occurs(num_names) + 1;
                    index_occurs(num_occurs(num_names),num_names) = jj;
                    marker = [marker jj];
                end % otherwise, nothing happens and jj isn't marked
            end
        end
    end
end
%
% plot occurances
figure
b = bar(num_occurs);
text(1:length(num_occurs),num_occurs,num2str(num_occurs'),'vert','bottom','horiz','center'); % found online 
xticklabels(names);
xtickangle(45);
xlabel('Network Name')
ylabel('Number of Occurances')
title('Repeated Networks During Scan Period')
grid on;

% plot signal level over the period
fig = figure;
for i = 1:6
    subplot(6,1,i)
    indvec = index_occurs(:,i);
    indvec(indvec==0) = [];
    plot(signal_level_dbm(indvec))
    legend(names{i},'Location','Southwest')
    xticklabels({})
end
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Signal Level (dBm)');
xlabel(han,'time');
title(han,'Signal Level of Each Network During Scan Period')
fig.Position = [190 71 791 734];
% 126-131 found online

% Plot channel!
fig = figure;
for i = 1:6
    subplot(6,1,i)
    indvec = index_occurs(:,i);
    indvec(indvec==0) = [];
    plot(channel(indvec))
    legend(names{i},'Location','Northwest')
    xticklabels({})
end
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Channel #');
xlabel(han,'time');
title(han,'Channel of Each Network During Scan Period')
fig.Position = [190 71 791 734];

% Plot frequency!
fig = figure;
for i = 1:6
    subplot(6,1,i)
    indvec = index_occurs(:,i);
    indvec(indvec==0) = [];
    plot(freq(indvec))
    legend(names{i},'Location','Northeast')
    xticklabels({})
end
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Frequency (Hz)');
xlabel(han,'time');
title(han,'Frequency of Each Network During Scan Period')
fig.Position = [190 71 791 734];