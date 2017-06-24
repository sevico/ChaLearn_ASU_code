% This m-file generates mat-files of features according to the pool5 features
% extracted by C3D model.
% 'pool5_file_root' is the directory of .pool5 features extracted by C3D model.
% These .pool5 files can be either genereated by C3D model.
% 'feature_size' indicates the number of features. It can be either 35878
% for training features or 6271 for test features.
% 'feature_type' can be either 'rgb','rgb_section','depth' and 'flow' for rgb, rgb(section sampled), depth and
% optical flow features.
% The mat-file of features are saved in directory './features/' and will be
% employed for SVM classification.

fclose all;
clc
clear


feature_size = 35878;   % please change it to 6271 if get features for test data!!!
feature_type = 'rgb_section';
phase = '';
if  feature_size == 35878
    phase='train';
else if feature_size == 6271
        phase='test';
    end
end

pool5_file_root = ['./pool5/',feature_type,'_',phase]; % the path should be modified to the direct pool5 files' folder. e.g. for depth training data, it will be './pool5/depth_train/'

count_not_found = 0;
fet = zeros(1,4096);
for i=1:feature_size
    if mod(i,100)==0
        disp(i);
    end
    name_str=num2str(i);
    for j=1:5-length(name_str)
        name_str = ['0',name_str];
    end
    if exist([pool5_file_root,'/0',name_str,'.pool5'],'file')
        fid = fopen([pool5_file_root,'/0',name_str,'.pool5'],'r');
        [a,n]=fread(fid,5,'int');
        pos = prod(a);
        [b,n]=fread(fid,pos,'float');
        b=b';%����Ϊ������
        fet=[fet;b];
        
        
        fclose all;
    else
        count_not_found = count_not_found + 1;
    end
    
end

fet = fet(2:end,:);

eval([feature_type,'_32_',phase,'_fet','=zeros(',num2str(feature_size),',4096);']);
eval([feature_type,'_32_',phase,'_fet','=fet;']);
save(['../../svm_classification/features/',feature_type,'_32_',phase,'_fet.mat'],[feature_type,'_32_',phase,'_fet']); %�Զ�Ӧ��������Ӧmat

