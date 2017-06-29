% This m-file generates 32-frame videos which is required for the C3D 
% model (extracting features)
% The variable 'root' indicates the root directory of original video provided by the
% challenge (here assuming the train videos are waiting for processing.)
% The variable 'feature_number' indicates the number of sample. In other
% words, when feature_number equals 35878, the train samples are
% processed,whereas 6271 indicates test samples.
% the files are unzipped and locate at 'C:/IsoGD/IsoGD_phase_1/train/')
% The variable 'writePath' indicates the location of generated 32-frame videos. The
% RGB-video, depth-video and saliency-video are genreated in the same time.
% The saliency video is obtained in terms of the code provided by Achanta
% associated with "Frequency-tuned Salient Region Detection" on CVPR '09.
% More information about it can be seen in the saliency.m.

clear
clc


feature_number = 35878;  % please modify it to 35878 for training data and 6271 for test data

sample_type = '';
if feature_number == 35878
    sample_type = 'train';
else if feature_number == 6271
        sample_type = 'test';
    end
end

rootM = ['../../data/',sample_type,'_RGB/'];
rootK = ['../../data/',sample_type,'_depth/'];


writePath = '../../data/';

benchmarkNumFrame = 32;

for i=1:length(dir(rootM))
    i
    folderName = num2str(i,'%03d');
   
    
    directM = [rootM,folderName];
    Mfiles = dir([directM,'/M_*.avi']);
    directK = [rootK,folderName];
    Kfiles = dir([directK,'/K_*.avi']);
    
   for j = 1:length(Mfiles)
       Mobj = VideoReader([rootM,folderName,'/',Mfiles(j).name]);
       numFrames = Mobj.NumberOfFrames;
       rate = Mobj.FrameRate;
       Mvideo = read(Mobj);
       
       Kobj = VideoReader([rootK,folderName,'/',Kfiles(j).name]);
       
       Kvideo = read(Kobj);
       % condition 
%        samp = sampling(numFrames,benchmarkNumFrame); % sampling!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
       
       % write
       if ~exist([writePath,sample_type,'_RGB_filtered/',folderName])
           mkdir([writePath,sample_type,'_RGB_filtered/',folderName]);
       end
       
        if ~exist([writePath,sample_type,'_depth_filtered/',folderName])
           mkdir([writePath,sample_type,'_depth_filtered/',folderName]);
        end
      
       
       wMObj = VideoWriter([writePath,sample_type,'_RGB_filtered/',folderName,'/',Mfiles(j).name]);
       wKObj = VideoWriter([writePath,sample_type,'_depth_filtered/',folderName,'/',Kfiles(j).name]);
       
       wMObj.FrameRate = rate;
       wKObj.FrameRate = rate;
       wSObj.FrameRate = rate;
       open(wMObj);
       open(wKObj);

       for len = 1:numFrames
           Mimg = retinex(Mvideo(:,:,:,len));
           writeVideo(wMObj,Mimg);
           
           for c=1:3
               Kimg(:,:,c) = medfilt2(Kvideo(:,:,c,len),[5,5]);
           end
           writeVideo(wKObj,Kimg);
           
       end
       
       close(wMObj);
       close(wKObj);
       
       fclose all;
   end
   

end
