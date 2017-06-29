% This script is used for generating optical flow videos associated with
% the original IsoGD data. 
% You need to appoint the source path to original IsoGD data in the
% variable "root", and the destination path to the generated optical flow
% data within "writePath".  The variable 'feature_number' indicates the number of sample.
%  In other words, when feature_number equals 35878, the train samples are
% processed,whereas 6271 indicates test samples.
% The optical flow data is generated according to Brox et al.'s paper "".

clear
clc


root = '../example_data/IsoGD_phase_1/train/'; % the path to the original video in IsoGD, the last folder should be "train" or "test", depending on what video you are processing. e.g., for training data, it can be './IsoGD_phase_1/train/'(here we use a relative path)
writePath = '../example_data/'; % the path to save the generated optical flow data

feature_number = 35878;  % please REMEMBER to modify it to 35878 for training data and 6271 for test data

sample_type = '';
if feature_number == 35878
    sample_type = 'train';
else if feature_number == 6271
        sample_type = 'test';
    end
end

folders = dir([root]);

for i=1:length(folders)
   disp(['folder ',num2str(i)]);
   
    folderName = num2str(i,'%03d');
   
    
    direct = [root,folderName];
    Mfiles = dir([direct,'/M_*.avi']);
   
    
   for j = 1:length(Mfiles)
       Mobj = VideoReader([root,folderName,'/',Mfiles(j).name]);
       numFrames = Mobj.NumberOfFrames;
       rate = Mobj.FrameRate;
       Mvideo = read(Mobj);
       
   
       flows = flow_calculate(Mvideo);
       
        if ~exist([writePath,sample_type,'_flow_original/',folderName])
           mkdir([writePath,sample_type,'_flow_original/',folderName]);
        end
       

       str = Mfiles(j).name;
       wSObj = VideoWriter([writePath,sample_type,'_flow_original/',folderName,'/F',str(2:length(str))]);

       wSObj.FrameRate = rate;

       open(wSObj);

       
       for len = 1:size(flows,4)
          Fimg = flows(:,:,:,len);
           writeVideo(wSObj,Fimg);
       end
       

       close(wSObj);
       
       fclose all;
   end
   

end
