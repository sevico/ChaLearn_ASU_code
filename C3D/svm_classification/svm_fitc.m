%% this script loads features that extracted by C3D and TSN in previous steps. First the features are put into the folder "feature",
%% then the svm classifier that implmented by matlab toolbox (2015b+) is employed for classifying. 
%% Final test prediction matrix is saved in the folder "pred_mat".

close all
clear
clc

feats = dir('./features/');
for i=3:length(feats)
    load(['./features/',feats(i).name]);
end

% if the tsn features are not added in the  folder "features", you must load them manually.
% load('depth_tsn_train_avg_3.mat'); 
% load('depth_tsn_test_avg_3.mat');
% load('flow_tsn_train_avg_3.mat');
% load('flow_tsn_test_avg_3.mat');
train = [rgb_32_train_fet+rgb_section_32_train_fet,depth_32_train_fet,flow_32_train_fet,depth_tsn_train_avg_3+flow_tsn_train_avg_3];
test = [rgb_32_test_fet+rgb_section_32_test_fet,depth_32_test_fet,flow_32_test_fet,depth_tsn_test_avg_3+flow_tsn_test_avg_3];

lb_test = zeros(6271,1);
pr_test = double(zeros(6271,1))-99;
for i = 1:249
    i
    lab_c = zeros(35878,1);
    lab_c(train_all_35878_label_gt==i) = 1;
    svmmdl = fitcsvm(train,lab_c);
    [label,p] = predict(svmmdl,test);
    prob = p(:,2);
%     prob(prob<0)=0;
    lb_test(prob>pr_test)=i;
    pr_test(prob>pr_test)=prob(prob>pr_test); 
%     lb_test(label==1) = i;
end

eval('test_prediction=lb_test;');
save('./pred_mat/test_prediction.mat','test_prediction');