%This script is used to implement a consensus fusion of multiple segement features extracted by TSN.
% Please change the data_num with either training data or testing data. 
% seg_num: it is 3 for depth data and 2 for flow data.
% modality can be either 'depth' or 'flow' 
% Remember to copy the generated feature matrices to the svm_classification folder in directory C3D-v1.1/ for final classification.

clc;
clear;

data_num = 35878; 
seg_num = 3; % for flow data, this parameter is 2.
modality = 'depth'

sample_type = '';
if data_num == 35878
    sample_type = 'train';
else if feature_number == 6271
        sample_type = 'test';
    end
end

feature = [];
for i=1:3:data_num*seg_num
    feat= [feats(i,:)+feats(i+1,:)+feats(i+2,:)];
    feature = [feature;feat];
end

eval([sample_type,'_',modality,'_avg_',num2str(seg_num),'=feature;']);
save([sample_type,'_',modality,'_avg_',num2str(seg_num),'.mat'],[sample_type,'_',modality,'_avg_',num2str(seg_num)]);
