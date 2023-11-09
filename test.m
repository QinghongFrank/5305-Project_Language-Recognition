function index = test(Gmm)

AidDir = 'test_set';

if AidDir == 0 
    fprintf('Please Select a New Folder!\n');
else
	cd(AidDir)
	RawFile = dir('**/*.*'); 
	AllFile = RawFile([RawFile.isdir]==0);
    if isempty(fieldnames(AllFile))
    	fprintf('\n There are no files in this folder!\n');
    else	
    	fprintf('\n Number of Files: %i \n',size(AllFile,1));
    end
end

cd('..')

for i = 1:1:400
    % Initialize
    class_mfcc = [];
    delta_mfcc = [];
    delta_delta_mfcc = [];
    MFCC = [];
    
    % Read wave data
    name = AllFile(i).name;
    folder = AllFile(i).folder;
    audiodir = [folder, '\', name]; % data direction
    [test_sig, fs] = audioread(audiodir); % load data
    class_mfcc= mfcc(test_sig,fs);  % mfcc feature
    testing_feature = class_mfcc(:,3:14);
    %testing_feature = [class_mfcc(:,2:32);delta_mfcc(:,2:32)];
    testing_MFCC = testing_feature(1:180,:);
    match = MFCC_feature_compare(testing_MFCC,Gmm);
    [m, x] = max(match);
    %fprintf('%d',x)
    xx(i) = x;
end

index = xx;