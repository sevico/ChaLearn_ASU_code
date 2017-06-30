%% this script loads features that extracted by C3D and TSN in previous steps. First the features are put into the folder "feature",
%% then the svm classifier that implmented by matlab toolbox (2015b+) is employed for classifying. 
%% Final test prediction matrix is saved in the folder "pred_mat".

close all
clear
clc

feats = dir('./features/');
for i=3:length(feats)
    load(['./features/',feats(i).name]);
    disp(['load feature ',feats(i).name, 'done！']);
end

% if the tsn features are not added in the  folder "features", you must load them manually.
% load('depth_tsn_train_avg_3.mat'); 
% load('depth_tsn_test_avg_3.mat');
% load('flow_tsn_train_avg_3.mat');
% load('flow_tsn_test_avg_3.mat');


 [r1train,r1test]=ccaFuse(rgb_32_train_fet,rgb_filtered_32_train_fet,rgb_32_test_fet,rgb_filtered_32_test_fet);
 [d1train,d1test]=ccaFuse(depth_32_train_fet,depth_filtered_32_train_fet,depth_32_test_fet,depth_filtered_32_test_fet);
 [d3train,d3test]=ccaFuse(d1train,depth_section_32_train_fet,d1test,depth_section_32_test_fet);
 clear d1train  d1test 
 clear rgb_32_train_fet rgb_filtered_32_train rgb_32_test_fet rgb_filtered_32_test_fet
 clear depth_32_train_fet depth_section_32_train_fet depth_32_test_fet depth_section_32_test_fet depth_filtered_32_train_fet depth_filtered_32_test_fet



 train = [r1train,d3train,flow_32_train_fet,tsn_train_depth_avg_3+tsn_train_flow_avg_3];
 test = [r1test,d3test,flow_32_test_fet,tsn_test_depth_avg_3+tsn_test_flow_avg_3];


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