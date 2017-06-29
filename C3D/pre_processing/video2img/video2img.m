%%This script is used to generate frame images from IsoGD videos. You
%%should  appoint the path of original IsoGD RGB-D videos,  generated
%%optical flow videos and the output frame Images. Particularly, the
%%directory structure of IsoGD_img is not like that of IsoGD videos. The
%%folders are generated for each video, and the testing video are start
%%with a 'T' (e.g., the image folder for M_00001.avi in testing data is TM_00001)
%% Remeber to copy the images to the "data" folder in tsn project.

clear
clc

rootMK = '../example_data/IsoGD_phase_1/train/';
rootFlow = '../example_data/train_flow_original/';

writePath = '../example_data/IsoGD_img/';

feature_number = 35878;  % please modify it to 35878 for training data and 6271 for test data！!！!

sample_type = '';
if feature_number == 35878
    sample_type = '';
else if feature_number == 6271
        sample_type = 'T';
    end
end

folders = dir([rootMK]);

for i = 1:length(folders) 
    directMK = [rootMK,'/',folders(i).name];
    directFlow = [rootFlow,'/',folders(i).name];
    
    Mfiles = dir([directMK,'/M_*.avi']);%'/M_*.avi' is for IsoGD
    Kfiles = dir([directMK,'/K_*.avi']);
    
    Ffiles = dir([directFlow,'/F_*.avi']);
    
    for j=1:length(Mfiles)
        Mobj = VideoReader([directMK,'/',Mfiles(j).name]);
        Kobj = VideoReader([directMK,'/',Kfiles(j).name]);
        Fobj = VideoReader([directFlow,'/',Ffiles(j).name]);
        numFrames = Mobj.NumberOfFrames;
        rate = Mobj.FrameRate;
        Mvideo = read(Mobj);
        Kvideo = read(Kobj);
       Fvideo = read(Fobj);
        if numFrames<=16
            samp = sampling(numFrames,20); % sampling!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        else 
            samp = 1:numFrames
        end

        for len = 1:length(samp)
            Mimg = Mvideo(:,:,:,samp(len));
            index = num2str(len,'%04d')
            str = [writePath,'/RGB/',sample_type,Mfiles(j).name];
            newFolder = str(1:end-4);
            if ~exist(newFolder)
                mkdir(newFolder);
            end
            imwrite(Mimg,[newFolder,'/',Mfiles(j).name(1:end-4),'.',index,'.jpg']);
            % k files
            Kimg = Kvideo(:,:,:,samp(len));
            index = num2str(len,'%04d')
            str = [writePath,'/depth/',sample_type,Kfiles(j).name];
            newFolder = str(1:end-4);
            if ~exist(newFolder)
                mkdir(newFolder);
            end
            imwrite(Kimg,[newFolder,'/',Kfiles(j).name(1:end-4),'.',index,'.jpg']);
            %Flow files
            Fimg = Fvideo(:,:,:,min(numFrames-1,samp(len)));
            index = num2str(len,'%04d')
            str = [writePath,'/flow/',sample_type,Ffiles(j).name];
            newFolder = str(1:end-4);
            if ~exist(newFolder)
                mkdir(newFolder);
            end
           imwrite(Fimg,[newFolder,'/',Ffiles(j).name(1:end-4),'.',index,'.jpg']);

         end

    end
  
end