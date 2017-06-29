% This m-file generates 32-frame videos which is required for the C3D 
% model (extracting features)
% The variable 'rootMK' indicates the root directory of original video provided by the
% challenge (here assuming the train videos are waiting for processing.)
% The variable ‘rootFlow’ indicates the root directory of generated optical
% flow videos.
% The variable 'feature_number' indicates the number of sample. In other
% words, when feature_number equals 35878, the train samples are
% processed,whereas 6271 indicates test samples.
% The variable 'writePath' indicates the location of generated 32-frame videos. The
% RGB-video, depth-video and flow-video are genreated in the same time.

clear
clc


rootMK = '../example_data/IsoGD_phase_1/train/'; % path to the original RGB-D data,the last folder should be "train" or "test", depending on what video you are processing. e.g., for training data, it can be './IsoGD_phase_1/train/' (here we use a relative path)
rootFlow = '../example_data/train_flow_original/'; % path to the optical flow data which is generated from optical_flow.m. Modify it according to the folder of train or test data.
feature_number = 35878;  % please modify it to 35878 for training data and 6271 for test data

sample_type = '';
if feature_number == 35878
    sample_type = 'train';
else if feature_number == 6271
        sample_type = 'test';
    end
end

writePath = '../../data/';

benchmarkNumFrame = 32;

for i=1:180
    i
    folderName = num2str(i,'%03d');
    
    
    directMK = [rootMK,folderName];
    
    Mfiles = dir([directMK,'/M_*.avi']);
    Kfiles = dir([directMK,'/K_*.avi']);
    
    directFlow = [rootFlow,folderName];
    
    Ffiles = dir([directFlow,'/F_*.avi']);
    
   for j = 1:length(Mfiles)
       Mobj = VideoReader([directMK,'/',Mfiles(j).name]);
       numFrames = Mobj.NumberOfFrames;
       rate = Mobj.FrameRate;
       Mvideo = read(Mobj);
       
       Kobj = VideoReader([directMK,'/',Kfiles(j).name]);
       Kvideo = read(Kobj);
       
       Fobj = VideoReader([directFlow,'/',Ffiles(j).name]);
       Fvideo = read(Fobj);
       % condition 
       samp = sampling(numFrames,benchmarkNumFrame); % sampling!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
       
       % write
       if ~exist([writePath,sample_type,'_RGB/',folderName])
           mkdir([writePath,sample_type,'_RGB/',folderName]);
       end
       
        if ~exist([writePath,sample_type,'_depth/',folderName])
           mkdir([writePath,sample_type,'_depth/',folderName]);
        end
       
        if ~exist([writePath,sample_type,'_flow/',folderName])
           mkdir([writePath,sample_type,'_flow/',folderName]);
        end
       
       wMObj = VideoWriter([writePath,sample_type,'_RGB/',folderName,'/',Mfiles(j).name]);
       wKObj = VideoWriter([writePath,sample_type,'_depth/',folderName,'/',Kfiles(j).name]);
       str = Mfiles(j).name;
       wFObj = VideoWriter([writePath,sample_type,'_flow/',folderName,'/F',str(2:length(str))]);
       wMObj.FrameRate = rate;
       wKObj.FrameRate = rate;
       wFObj.FrameRate = rate;
       open(wMObj);
       open(wKObj);
       open(wFObj);
       for len = 1:length(samp)
           Mimg = Mvideo(:,:,:,samp(len));
           writeVideo(wMObj,Mimg);
           
           Kimg = Kvideo(:,:,:,samp(len));
           writeVideo(wKObj,Kimg);
           
           Fimg = Fvideo(:,:,:,min(numFrames-1 ,samp(len)));
           writeVideo(wFObj,Fimg);
       end
       
       close(wMObj);
       close(wKObj);
       close(wFObj);
       
       fclose all;
   end
   

end
