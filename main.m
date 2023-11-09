clc,clear

AidDir = 'data_set'; % path for dataset
feature_extraction(AidDir); % gain MFCC fetures

% load data
load('English.mat');
load('German.mat');
load('Italian.mat');
load('Russian.mat');

numDim = 64;

%Training GMM for English
fprintf('\n Trainig GMM for English……');
[English.mu, English.sigm,English.c] = gmm_estimate(feature_english,numDim);

%Training GMM for German
fprintf('\n Trainig GMM for German……');
[German.mu, German.sigm,German.c] = gmm_estimate(feature_german,numDim);

%Training GMM for Italian
fprintf('\n Trainig GMM for Italian……');
[Italian.mu, Italian.sigm,Italian.c] = gmm_estimate(feature_italian,numDim);

%Training GMM for Russian
fprintf('\n Trainig GMM for Russian……');
[Russian.mu, Russian.sigm,Russian.c] = gmm_estimate(feature_russian,numDim);

gmm(1) = English;
gmm(2) = German;
gmm(3) = Italian;
gmm(4) = Russian;

save("GMM.mat","gmm")

index = test(gmm)';

% English (index 1)
[test_sig,fs] = audioread("test_english.wav");
class_mfcc = mfcc(test_sig,fs);
testing_MFCC = class_mfcc(:,3:14);
testing_feature = testing_MFCC(1:180,:);

match = MFCC_feature_compare(testing_feature,gmm);
[max_1, index_1] = max(match);

% German (index 2)
[test_sig,fs] = audioread("test_german.wav");
class_mfcc = mfcc(test_sig,fs);
testing_MFCC = class_mfcc(:,3:14);
testing_feature = testing_MFCC(1:180,:);

match = MFCC_feature_compare(testing_feature,gmm);
[max_2, index_2] = max(match);


% Italian (index 3)
[test_sig,fs] = audioread("test_italian.wav");
class_mfcc = mfcc(test_sig,fs);
testing_MFCC = class_mfcc(:,3:14);
testing_feature = testing_MFCC(1:180,:);

match = MFCC_feature_compare(testing_feature,gmm);
[max_3, index_3] = max(match);

% Russian (index 4)
[test_sig,fs] = audioread("test_russian.wav");
class_mfcc = mfcc(test_sig,fs);
testing_MFCC = class_mfcc(:,3:14);
testing_feature = testing_MFCC(1:180,:);

match1 = MFCC_feature_compare(testing_feature,gmm);
[max_4, index_4] = max(match1);
