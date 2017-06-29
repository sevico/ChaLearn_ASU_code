%This script is used to implement a consensus fusion of multiple segement features extracted by TSN.
% Please change the data_num with either training data or testing data. 
% modality can be either 'depth' or 'flow' 
% Remember to copy the generated feature matrices to the svm_classification folder in directory C3D-v1.1/ for final classification.

clc;
clear;

data_num = 6271; 
seg_num = 3; 
modality = 'flow';

sample_type = '';
if data_num == 35878
    sample_type = 'train';
else if data_num == 6271
        sample_type = 'test';
    end
end
disp('feature loading...')
load([modality,'/fc6-',modality,'-',sample_type,'.mat']);
disp('done!')
feature = [];
disp('segment feature consensus fusion...')
for i=1:3:data_num*seg_num
    feat= [feats(i,:)+feats(i+1,:)+feats(i+2,:)];
    feature = [feature;feat];
end
disp('done!')
eval(['tsn_',sample_type,'_',modality,'_avg_',num2str(seg_num),'=feature;']);
save(['tsn_',sample_type,'_',modality,'_avg_',num2str(seg_num),'.mat'],['tsn_',sample_type,'_',modality,'_avg_',num2str(seg_num)]);
