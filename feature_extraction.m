function feature_extraction(AidDir)

if AidDir == 0 
    fprintf('Please Select a New Folder!\n');
else
	cd(AidDir)
	RawFile = dir('**/*.*'); 
	AllFile = RawFile([RawFile.isdir]==0);
    if isempty(fieldnames(AllFile))
    	fprintf('There are no files in this folder!\n');
    else	
    	fprintf('Number of Files: %i \n',size(AllFile,1));
    end
end

% Initialize
feature_german = [];
feature_english = [];
feature_italian = [];
feature_japanese = [];
feature_russian = [];

% there are 3200 data, each language get 600
for i = 1:1:3200
    % Initialize
    class_mfcc = [];
    delta_mfcc = [];
    delta_delta_mfcc = [];
    MFCC = [];
    
    % Read wave data
    name = AllFile(i).name;
    folder = AllFile(i).folder;
    audiodir = [folder, '\', name]; % data direction
    [sig, fs] = audioread(audiodir); % load data
    
    % Extract MFCC feature
    class_mfcc= mfcc(sig,fs);  % mfcc feature
    MFCC_feature = class_mfcc(:,3:14);
    %MFCC_feature = [class_mfcc(:,2:32);delta_mfcc(:,2:32)];
    MFCC = MFCC_feature(1:180,:);

    SDC = mfcc2sdc(MFCC,11,1,3,180);
    
    % Combine to one dataset for each language
    if i >= 1 && i <= 800
        language = 'German';
        feature_german = horzcat(feature_german, MFCC);
        SDC_german = horzcat(SDC_german, SDC);
    end

    if i >= 601 && i <= 1600
        language = 'English';
        feature_english = horzcat(feature_english, MFCC);
        SDC_english = horzcat(SDC_english, SDC);
    end

    if i >= 1201 && i <= 2400
        language = 'Italian';
        feature_italian = horzcat(feature_italian, MFCC);
        SDC_italian = horzcat(SDC_italian, SDC);
    end

    if i >= 1801 && i <= 3200
        language = 'Russian';
        feature_russian = horzcat(feature_russian, MFCC);
        SDC_russian = horzcat(SDC_russian, SDC);
    end
end

cd('..')

% Save the data
save('German.mat',"feature_german")
save('English.mat',"feature_english")
save('Italian.mat',"feature_italian")
save('Russian.mat',"feature_russian")

fprintf('Extraction Finished')

end
